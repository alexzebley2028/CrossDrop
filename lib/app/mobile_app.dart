import 'dart:async';

import 'package:crossdrop/app/file_paths.dart';
import 'package:crossdrop/app/notification_actions.dart';
import 'package:crossdrop/app/pending_transfer.dart';
import 'package:crossdrop/app/reveal_file.dart';
import 'package:crossdrop/app/transfer_metadata_extensions.dart';
import 'package:crossdrop/app/widgets/device_name_notice.dart';
import 'package:crossdrop/app/widgets/outgoing_send_section.dart';
import 'package:crossdrop/app/widgets/send_text_dialog.dart';
import 'package:crossdrop/app/widgets/settings_panel.dart';
import 'package:crossdrop/app/widgets/transfer_request_panel.dart';
import 'package:crossdrop/app/widgets/visibility_control.dart';
import 'package:crossdrop/app_config.dart';
import 'package:crossdrop/app_theme.dart';
import 'package:crossdrop/nearby_share/api/models.dart';
import 'package:crossdrop/nearby_share/manager/nearby_manager.dart';
import 'package:crossdrop/notifications.dart';
import 'package:crossdrop/settings/receive_visibility.dart';
import 'package:crossdrop/settings/settings_controller.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:logging/logging.dart';

final Logger _log = Logger('mobile_app');

class MobileApp extends StatefulWidget {
  final List<String> initialOutgoingFilePaths;

  const MobileApp({super.key, this.initialOutgoingFilePaths = const []});

  @override
  State<MobileApp> createState() => _MobileAppState();
}

class _MobileAppState extends State<MobileApp>
    with WidgetsBindingObserver
    implements NearbyEventsListener {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  final Map<String, PendingTransfer> _pendingTransfers = {};
  final List<String> _outgoingFilePaths = [];

  late NearbyConnectionManager _manager;
  SettingsController? _settings;

  String? _broadcastName;
  bool _reconcilePending = false;
  bool _nearbyInitialized = false;
  bool _isStartingBroadcast = false;
  bool _isPickingOutgoingFiles = false;
  int _selectedIndex = 0;
  String? _receiveError;

  String? _outgoingConnectionId;
  String? _outgoingTargetDeviceId;
  RemoteDeviceInfo? _outgoingTargetDevice;
  String? _outgoingStatus;
  String? _outgoingPin;
  double? _outgoingProgress;
  Exception? _outgoingError;
  String? _outgoingText;

  bool get _hasOutgoingSelection =>
      _outgoingFilePaths.isNotEmpty || _outgoingText != null;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _manager = context.read<NearbyConnectionManager>();
    final settings = context.read<SettingsController>();
    if (!identical(settings, _settings)) {
      _settings?.removeListener(_onSettingsChanged);
      _settings = settings;
      settings.addListener(_onSettingsChanged);
    }
    registerNotificationActionHandler(_handleNotificationAction);
    if (_nearbyInitialized) return;
    _nearbyInitialized = true;
    _manager.addNearbyListener(this);
    unawaited(_initNearby());
  }

  Future<void> _initNearby() async {
    if (!mounted) return;
    if (widget.initialOutgoingFilePaths.isNotEmpty) {
      unawaited(_startOutgoingFileSelection(widget.initialOutgoingFilePaths));
    }
    await _reconcileBroadcast();
    await _reconcileScanning();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _settings?.removeListener(_onSettingsChanged);
    registerNotificationActionHandler(null);
    _manager.removeNearbyListener(this);
    unawaited(_manager.stopBroadcasting());
    unawaited(_manager.stopDiscovery());
    unawaited(_manager.stopNearbyShareScanning());
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed && _nearbyInitialized) {
      unawaited(_reconcileBroadcast());
    }
  }

  void _onSettingsChanged() {
    unawaited(_reconcileBroadcast());
    unawaited(_reconcileScanning());
  }

  /// Scans for nearby senders only while hidden, so CrossDrop can "wake" and
  /// briefly become discoverable on demand instead of staying unreachable.
  Future<void> _reconcileScanning() async {
    final settings = _settings;
    if (settings == null) return;
    try {
      if (settings.visibility == ReceiveVisibility.hidden) {
        await _manager.startNearbyShareScanning();
      } else {
        await _manager.stopNearbyShareScanning();
      }
    } catch (e, s) {
      _log.severe('Failed to reconcile nearby-share scanning: $e\n$s');
    }
  }

  @override
  void onNearbySharingDetected() {
    final settings = _settings;
    if (settings == null || settings.visibility != ReceiveVisibility.hidden) {
      return;
    }
    _log.info('Nearby device sharing: waking to temporary visibility');
    unawaited(settings.setVisibility(ReceiveVisibility.temporary));
    unawaited(
      showNearbySharingNotification().catchError((e, s) {
        _log.severe('Failed to show nearby-sharing notification: $e\n$s');
      }),
    );
  }

  /// Starts, stops, or restarts the mDNS broadcast so it matches the current
  /// visibility and device name.
  Future<void> _reconcileBroadcast() async {
    final settings = _settings;
    if (settings == null) return;
    final name = settings.deviceName;

    if (!settings.shouldBroadcast) {
      if (_manager.isBroadcasting) {
        await _manager.stopBroadcasting();
        _broadcastName = null;
        if (mounted) setState(() {});
      }
      return;
    }

    if (_manager.isBroadcasting) {
      if (_broadcastName == name) return;
      // Name changed while broadcasting → restart with the new name.
      await _manager.stopBroadcasting();
      _broadcastName = null;
    }
    // A start is already in flight; re-run once it finishes so a name/visibility
    // change made mid-start isn't lost.
    if (_isStartingBroadcast) {
      _reconcilePending = true;
      return;
    }

    setState(() {
      _isStartingBroadcast = true;
      _receiveError = null;
    });

    try {
      await _manager.startBroadcasting(name);
      _broadcastName = name;
    } catch (e, s) {
      _log.severe('Failed to update receive visibility: $e\n$s');
      if (mounted) {
        setState(() {
          _receiveError = e.toString();
        });
      }
    } finally {
      _isStartingBroadcast = false;
      if (mounted) setState(() {});
      if (_reconcilePending) {
        _reconcilePending = false;
        unawaited(_reconcileBroadcast());
      }
    }
  }

  Future<void> _openSettings() async {
    final navContext = _navigatorKey.currentContext;
    if (navContext == null || !navContext.mounted) return;
    await showSettingsSheet(navContext);
  }

  String _receiveSubtitle(
    NearbyConnectionManager manager,
    SettingsController settings,
  ) {
    switch (settings.visibility) {
      case ReceiveVisibility.everyone:
        return manager.isBroadcasting ? 'Visible to everyone' : 'Starting…';
      case ReceiveVisibility.temporary:
        return 'Visible briefly';
      case ReceiveVisibility.hidden:
        return 'Hidden';
    }
  }

  @override
  void onDeviceFound(RemoteDeviceInfo device) {
    setState(() {});
    if (device.qrMatched &&
        _hasOutgoingSelection &&
        _outgoingConnectionId == null &&
        _outgoingTargetDeviceId == null) {
      unawaited(_sendSelectedFilesToDevice(device));
    }
  }

  @override
  void onDeviceLost(String deviceId) {
    setState(() {});
  }

  @override
  void onTransferRequest(
    TransferMetadata transfer,
    RemoteDeviceInfo device,
    String connectionId,
  ) {
    final pendingTransfer = transfer.copyWith(id: connectionId);
    setState(() {
      _selectedIndex = 0;
      _pendingTransfers[connectionId] = PendingTransfer(
        metadata: pendingTransfer,
        device: device,
      );
    });
    unawaited(
      showTransferNotification(pendingTransfer, device).catchError((e, s) {
        _log.severe('Failed to show transfer notification: $e\n$s');
      }),
    );
  }

  @override
  void onTransferFinished(String connectionId, bool success, Exception? error) {
    var stopOutgoingDiscovery = false;
    if (mounted) {
      setState(() {
        final inboundTransfer = _pendingTransfers[connectionId];
        if (inboundTransfer != null) {
          _pendingTransfers[connectionId] = inboundTransfer.copyWith(
            status: success
                ? PendingTransferStatus.finished
                : PendingTransferStatus.failed,
            error: error?.toString(),
          );
        }
        if (connectionId == _outgoingConnectionId ||
            connectionId == _outgoingTargetDeviceId) {
          _outgoingStatus = success ? 'Transfer finished' : 'Transfer failed';
          _outgoingProgress = success ? 1 : _outgoingProgress;
          _outgoingError = error;
          _outgoingConnectionId = null;
          _outgoingTargetDeviceId = null;
          _outgoingTargetDevice = null;
          stopOutgoingDiscovery = true;
        }
      });
    }
    if (stopOutgoingDiscovery) {
      unawaited(_manager.stopDiscovery());
    }
    unawaited(cancelNotification(connectionId));
    if (!success && error != null && error is! NearbyCancellationException) {
      unawaited(showErrorNotification(connectionId, null, error.toString()));
    }
  }

  @override
  void onInboundTransferProgress(String connectionId, double progress) {
    final transfer = _pendingTransfers[connectionId];
    if (transfer == null) return;
    setState(() {
      _pendingTransfers[connectionId] = transfer.copyWith(
        status: PendingTransferStatus.receiving,
        progress: progress.clamp(0, 1).toDouble(),
      );
    });
  }

  @override
  void onInboundTextReceived(String connectionId, ReceivedPayload payload) {
    final transfer = _pendingTransfers[connectionId];
    if (transfer == null) return;
    setState(() {
      _pendingTransfers[connectionId] = transfer.copyWith(
        receivedPayload: payload,
      );
    });
  }

  @override
  void onOutgoingTransferStarted(String deviceId, String connectionId) {
    setState(() {
      _outgoingConnectionId = connectionId;
      _outgoingTargetDeviceId = deviceId;
      _outgoingStatus = 'Connecting...';
      _outgoingProgress = null;
      _outgoingError = null;
    });
  }

  @override
  void onOutgoingTransferProgress(String connectionId, double progress) {
    if (connectionId != _outgoingConnectionId) return;
    setState(() {
      _outgoingStatus = 'Sending...';
      _outgoingProgress = progress.clamp(0, 1).toDouble();
    });
  }

  @override
  void onOutgoingPinAvailable(String connectionId, String pin) {
    if (connectionId != _outgoingConnectionId) return;
    setState(() {
      _outgoingPin = pin;
      _outgoingStatus = 'Waiting for receiver...';
    });
  }

  Future<void> _respondToPendingTransfer(
    String connectionId,
    bool accept,
  ) async {
    if (mounted) {
      setState(() {
        if (accept) {
          final transfer = _pendingTransfers[connectionId];
          if (transfer != null) {
            _pendingTransfers[connectionId] = transfer.copyWith(
              status: PendingTransferStatus.receiving,
            );
          }
        } else {
          _pendingTransfers.remove(connectionId);
        }
      });
    }
    await _manager.respondToTransfer(connectionId, accept);
    await cancelNotification(connectionId);
  }

  void _dismissInboundTransfer(String connectionId) {
    setState(() {
      _pendingTransfers.remove(connectionId);
    });
  }

  Future<void> _openInboundTransferFile(PendingTransfer transfer) async {
    final localPath = _firstLocalPath(transfer);
    if (localPath == null) return;

    try {
      await openFileWithDefaultApp(localPath);
    } catch (e, s) {
      _log.severe('Failed to open received file: $e\n$s');
    }
  }

  String? _firstLocalPath(PendingTransfer transfer) {
    for (final file in transfer.metadata.files) {
      if (file.localPath != null) return file.localPath;
    }
    return null;
  }

  Future<void> _pickOutgoingFiles() async {
    setState(() {
      _selectedIndex = 1;
      _isPickingOutgoingFiles = true;
    });
    try {
      final files = await openFiles();
      await _startOutgoingFileSelection(files.map((file) => file.path));
    } catch (e, s) {
      _log.severe('Failed to pick outgoing files: $e\n$s');
      if (!mounted) return;
      setState(() {
        _outgoingStatus = 'Could not open file picker';
        _outgoingError = e is Exception ? e : Exception(e.toString());
      });
    } finally {
      if (mounted) setState(() => _isPickingOutgoingFiles = false);
    }
  }

  Future<void> _startOutgoingFileSelection(Iterable<String> paths) async {
    final filePaths = filePathsFromArgs(paths);
    if (filePaths.isEmpty) return;

    if (!mounted) return;
    setState(() {
      _selectedIndex = 1;
      _outgoingText = null;
      _outgoingFilePaths
        ..clear()
        ..addAll(filePaths);
      _resetOutgoingProgressState();
      _outgoingStatus = 'Looking for nearby devices...';
    });

    await _beginOutgoingDiscovery();
  }

  Future<void> _composeAndSendText() async {
    final text = await _promptForText();
    if (text == null || text.trim().isEmpty) return;
    if (!mounted) return;
    setState(() {
      _selectedIndex = 1;
      _outgoingFilePaths.clear();
      _outgoingText = text.trim();
      _resetOutgoingProgressState();
      _outgoingStatus = 'Looking for nearby devices...';
    });

    await _beginOutgoingDiscovery();
  }

  Future<String?> _promptForText() async {
    final navContext = _navigatorKey.currentContext;
    if (navContext == null || !navContext.mounted) return null;
    return promptForSendText(navContext);
  }

  void _resetOutgoingProgressState() {
    _outgoingConnectionId = null;
    _outgoingTargetDeviceId = null;
    _outgoingTargetDevice = null;
    _outgoingPin = null;
    _outgoingProgress = null;
    _outgoingError = null;
  }

  Future<void> _beginOutgoingDiscovery() async {
    try {
      await _manager.startDiscovery();
    } catch (e, s) {
      _log.severe('Failed to start discovery for outgoing transfer: $e\n$s');
      if (!mounted) return;
      setState(() {
        _outgoingStatus = 'Could not start discovery';
        _outgoingError = e is Exception ? e : Exception(e.toString());
      });
    }
  }

  String _outgoingTextLabel(String text) {
    final single = text.replaceAll('\n', ' ').trim();
    final preview = single.length > 40 ? '${single.substring(0, 40)}…' : single;
    return 'Text: $preview';
  }

  Future<void> _sendSelectedFilesToDevice(RemoteDeviceInfo device) async {
    if (!_hasOutgoingSelection || _outgoingConnectionId != null) return;
    setState(() {
      _outgoingTargetDeviceId = device.id;
      _outgoingTargetDevice = device;
      _outgoingStatus = 'Connecting to ${device.name}...';
      _outgoingPin = null;
      _outgoingProgress = null;
      _outgoingError = null;
    });

    try {
      final text = _outgoingText;
      if (text != null) {
        await _manager.initiateTextTransfer(device.id, text);
      } else {
        await _manager.initiateTransfer(device.id, List.of(_outgoingFilePaths));
      }
      await _manager.stopDiscovery();
    } catch (e, s) {
      _log.severe('Failed to start outgoing transfer: $e\n$s');
      if (!mounted) return;
      setState(() {
        _outgoingStatus = 'Could not start transfer';
        _outgoingError = e is Exception ? e : Exception(e.toString());
        _outgoingTargetDeviceId = null;
        _outgoingTargetDevice = null;
      });
    }
  }

  Future<void> _clearOutgoingSelection() async {
    await _manager.stopDiscovery();
    if (!mounted) return;
    setState(() {
      _outgoingFilePaths.clear();
      _outgoingText = null;
      _outgoingStatus = null;
      _resetOutgoingProgressState();
    });
  }

  void _handleNotificationAction(String connectionId, bool accepted) {
    unawaited(
      _respondToPendingTransfer(connectionId, accepted).catchError((e, s) {
        _log.severe(
          'Failed to handle notification action for $connectionId: $e\n$s',
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<AppTheme>();

    return MaterialApp(
      title: AppConfig.name,
      navigatorKey: _navigatorKey,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: appThemeSeedColor),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: appThemeSeedColor,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      themeMode: appTheme.mode,
      debugShowCheckedModeBanner: false,
      home: _MobileHome(
        selectedIndex: _selectedIndex,
        pendingTransferCount: _pendingTransfers.length,
        onSelectIndex: (index) => setState(() => _selectedIndex = index),
        onOpenSettings: () => unawaited(_openSettings()),
        receiveViewBuilder: _buildReceiveView,
        sendViewBuilder: _buildSendView,
      ),
    );
  }

  Widget _buildReceiveView(BuildContext context) {
    final manager = context.watch<NearbyConnectionManager>();
    final settings = context.watch<SettingsController>();
    final pendingTransfers = _pendingTransfers.entries.toList(growable: false);

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
      children: [
        _SectionHeader(
          icon: Icons.download_rounded,
          title: 'Receive',
          subtitle: _receiveSubtitle(manager, settings),
        ),
        const SizedBox(height: 12),
        _ReceiveStatusPanel(
          visible: manager.isBroadcasting,
          starting: _isStartingBroadcast,
        ),
        if (_receiveError != null) ...[
          const SizedBox(height: 12),
          _InlineError(message: _receiveError!),
        ],
        const SizedBox(height: 20),
        VisibilityControl(
          visibility: settings.visibility,
          temporaryDuration: settings.temporaryVisibilityDuration,
          onChanged: (value) => unawaited(settings.setVisibility(value)),
        ),
        const SizedBox(height: 20),
        DeviceNameNotice(
          deviceName: settings.deviceName,
          visibility: settings.visibility,
        ),
        const SizedBox(height: 28),
        if (pendingTransfers.isEmpty)
          _EmptyState(
            icon: settings.visibility == ReceiveVisibility.hidden
                ? Icons.visibility_off_rounded
                : Icons.inbox_rounded,
            title: settings.visibility == ReceiveVisibility.hidden
                ? 'Hidden from senders'
                : (manager.isBroadcasting
                      ? 'Ready to receive'
                      : 'Starting visibility'),
          )
        else
          for (final entry in pendingTransfers)
            TransferRequestPanel(
              transfer: entry.value.metadata,
              device: entry.value.device,
              status: entry.value.status,
              progress: entry.value.progress,
              error: entry.value.error,
              receivedPayload: entry.value.receivedPayload,
              onAccept: () =>
                  unawaited(_respondToPendingTransfer(entry.key, true)),
              onDecline: () =>
                  unawaited(_respondToPendingTransfer(entry.key, false)),
              onDismiss: () => _dismissInboundTransfer(entry.key),
              onOpenFile: _firstLocalPath(entry.value) == null
                  ? null
                  : () => unawaited(_openInboundTransferFile(entry.value)),
            ),
      ],
    );
  }

  Widget _buildSendView(BuildContext context) {
    final manager = context.watch<NearbyConnectionManager>();

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
      children: [
        _SectionHeader(
          icon: Icons.upload_rounded,
          title: 'Send',
          subtitle: _outgoingText != null
              ? 'Text ready to send'
              : _outgoingFilePaths.isEmpty
              ? 'Nothing selected'
              : '${_outgoingFilePaths.length} selected',
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: FilledButton.icon(
                onPressed: _isPickingOutgoingFiles
                    ? null
                    : () => unawaited(_pickOutgoingFiles()),
                icon: const Icon(Icons.file_open_rounded),
                label: Text(
                  _isPickingOutgoingFiles ? 'Selecting...' : 'Choose files',
                ),
                style: FilledButton.styleFrom(
                  minimumSize: const Size.fromHeight(48),
                ),
              ),
            ),
            const SizedBox(width: 8),
            OutlinedButton.icon(
              onPressed: () => unawaited(_composeAndSendText()),
              icon: const Icon(Icons.notes),
              label: const Text('Text'),
              style: OutlinedButton.styleFrom(
                minimumSize: const Size.fromHeight(48),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        if (!_hasOutgoingSelection)
          const _EmptyState(
            icon: Icons.file_upload_outlined,
            title: 'Choose files or text to send',
          )
        else
          OutgoingSendPanel(
            outgoingFilePaths: _outgoingFilePaths,
            outgoingTextLabel: _outgoingText == null
                ? null
                : _outgoingTextLabel(_outgoingText!),
            status: _outgoingStatus,
            pin: _outgoingPin,
            progress: _outgoingProgress,
            error: _outgoingError,
            devices: manager.discoveredDevices,
            isDiscovering: manager.isDiscovering,
            qrCodeUrl: manager.discoveryQrCodeUrl,
            busy:
                _outgoingConnectionId != null ||
                _outgoingTargetDeviceId != null,
            selectedDeviceId: _outgoingTargetDeviceId,
            selectedDevice: _outgoingTargetDevice,
            onSendToDevice: (device) =>
                unawaited(_sendSelectedFilesToDevice(device)),
            onCancel: () => unawaited(_clearOutgoingSelection()),
          ),
      ],
    );
  }
}

typedef _PaneBuilder = Widget Function(BuildContext context);

class _MobileHome extends StatelessWidget {
  final int selectedIndex;
  final int pendingTransferCount;
  final ValueChanged<int> onSelectIndex;
  final VoidCallback onOpenSettings;
  final _PaneBuilder receiveViewBuilder;
  final _PaneBuilder sendViewBuilder;

  const _MobileHome({
    required this.selectedIndex,
    required this.pendingTransferCount,
    required this.onSelectIndex,
    required this.onOpenSettings,
    required this.receiveViewBuilder,
    required this.sendViewBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final wide = constraints.maxWidth >= 760;
        return Scaffold(
          appBar: AppBar(
            title: Text(AppConfig.name),
            actions: [
              IconButton(
                tooltip: 'Settings',
                onPressed: onOpenSettings,
                icon: const Icon(Icons.settings_outlined),
              ),
            ],
          ),
          body: SafeArea(
            child: wide
                ? Row(
                    children: [
                      Expanded(child: receiveViewBuilder(context)),
                      const VerticalDivider(width: 1),
                      Expanded(child: sendViewBuilder(context)),
                    ],
                  )
                : IndexedStack(
                    index: selectedIndex,
                    children: [
                      receiveViewBuilder(context),
                      sendViewBuilder(context),
                    ],
                  ),
          ),
          bottomNavigationBar: wide
              ? null
              : NavigationBar(
                  selectedIndex: selectedIndex,
                  onDestinationSelected: onSelectIndex,
                  destinations: [
                    NavigationDestination(
                      icon: _BadgedIcon(
                        icon: Icons.download_rounded,
                        count: pendingTransferCount,
                      ),
                      label: 'Receive',
                    ),
                    const NavigationDestination(
                      icon: Icon(Icons.upload_rounded),
                      label: 'Send',
                    ),
                  ],
                ),
        );
      },
    );
  }
}

class _BadgedIcon extends StatelessWidget {
  final IconData icon;
  final int count;

  const _BadgedIcon({required this.icon, required this.count});

  @override
  Widget build(BuildContext context) {
    if (count == 0) return Icon(icon);
    return Badge(label: Text('$count'), child: Icon(icon));
  }
}

class _SectionHeader extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _SectionHeader({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Icon(icon, color: theme.colorScheme.primary),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: theme.textTheme.headlineSmall),
              Text(subtitle, style: theme.textTheme.bodyMedium),
            ],
          ),
        ),
      ],
    );
  }
}

class _ReceiveStatusPanel extends StatelessWidget {
  final bool visible;
  final bool starting;

  const _ReceiveStatusPanel({required this.visible, required this.starting});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        border: Border.all(color: theme.dividerColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(
            visible ? Icons.sensors_rounded : Icons.sensors_off_rounded,
            color: visible ? theme.colorScheme.primary : theme.disabledColor,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              visible ? 'Visible while app is open' : 'Starting visibility',
              style: theme.textTheme.titleMedium,
            ),
          ),
          if (starting)
            const SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
        ],
      ),
    );
  }
}

class _InlineError extends StatelessWidget {
  final String message;

  const _InlineError({required this.message});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      message,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(color: theme.colorScheme.error),
    );
  }
}

class _EmptyState extends StatelessWidget {
  final IconData icon;
  final String title;

  const _EmptyState({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Column(
        children: [
          Icon(icon, size: 40, color: theme.colorScheme.outline),
          const SizedBox(height: 12),
          Text(title, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

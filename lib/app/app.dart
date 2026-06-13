import 'dart:async';

import 'package:crossdrop/animations.dart';
import 'package:crossdrop/app/file_intents.dart';
import 'package:crossdrop/app/file_paths.dart';
import 'package:crossdrop/app/notification_actions.dart';
import 'package:crossdrop/app/pending_transfer.dart';
import 'package:crossdrop/app/reveal_file.dart';
import 'package:crossdrop/app/transfer_metadata_extensions.dart';
import 'package:crossdrop/app/widgets/device_name_field.dart';
import 'package:crossdrop/app/widgets/outgoing_send_section.dart';
import 'package:crossdrop/app/widgets/receive_status_header.dart';
import 'package:crossdrop/app/widgets/transfer_request_panel.dart';
import 'package:crossdrop/app/window_setup.dart';
import 'package:crossdrop/app_config.dart';
import 'package:crossdrop/app_theme.dart';
import 'package:crossdrop/device.dart';
import 'package:crossdrop/nearby_share/api/models.dart';
import 'package:crossdrop/nearby_share/manager/nearby_manager.dart';
import 'package:crossdrop/notifications.dart';
import 'package:crossdrop/window/system_tray.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:window_manager/window_manager.dart';
import 'package:logging/logging.dart';

final Logger _log = Logger('app');

enum AnimationPhase { idle, fadeIn, visible, fadeOut }

class App extends StatefulWidget {
  final List<String> initialOutgoingFilePaths;

  const App({super.key, this.initialOutgoingFilePaths = const []});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> implements NearbyEventsListener {
  final TextEditingController _deviceNameController = TextEditingController();
  final Map<String, PendingTransfer> _pendingTransfers = {};
  final List<String> _outgoingFilePaths = [];

  late final FileIntentController _fileIntentController;
  late NearbyConnectionManager _manager;

  AppSystemTray? _appSystemTray;
  bool _isTextFieldEditing = false;
  bool _nearbyInitialized = false;
  String? _outgoingConnectionId;
  String? _outgoingTargetDeviceId;
  RemoteDeviceInfo? _outgoingTargetDevice;
  String? _outgoingStatus;
  String? _outgoingPin;
  double? _outgoingProgress;
  Exception? _outgoingError;
  bool _isPickingOutgoingFiles = false;

  int _currentShapeIndex = 0;
  Timer? _animationTimer;
  AnimationPhase _animationPhase = AnimationPhase.idle;
  double _opacity = 0.0;

  static const Duration _fadeInDuration = Duration(milliseconds: 1000);
  static const Duration _visibleDuration = Duration(milliseconds: 100);
  static const Duration _fadeOutDuration = Duration(milliseconds: 1000);

  @override
  void initState() {
    super.initState();
    _fileIntentController = FileIntentController(
      initialFilePaths: widget.initialOutgoingFilePaths,
      onOpenFiles: _startOutgoingFileSelection,
    );
    _fileIntentController.start();
    _triggerNextAnimationFrame();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _manager = context.read<NearbyConnectionManager>();
    registerNotificationActionHandler(_handleNotificationAction);
    if (_nearbyInitialized) return;
    _nearbyInitialized = true;
    _manager.addNearbyListener(this);
    unawaited(_initNearby());
  }

  Future<void> _initNearby() async {
    final currentDeviceName = await getDeviceName();
    if (mounted) {
      setState(() {
        _deviceNameController.text = currentDeviceName;
      });
      _appSystemTray = AppSystemTray(currentDeviceName);
      try {
        await _appSystemTray?.initSystemTray();
      } catch (e, s) {
        _log.severe("Failed to initialize system tray: $e\n$s");
      }
      try {
        _log.info("Starting broadcasting with name: $currentDeviceName");
        await _manager.startBroadcasting(currentDeviceName);
      } catch (e, s) {
        _log.severe("Failed to start broadcasting: $e\n$s");
      }
    }
  }

  void _triggerNextAnimationFrame() {
    if (!mounted) return;
    _animationTimer?.cancel();
    Duration nextPhaseDelay;
    switch (_animationPhase) {
      case AnimationPhase.idle:
        setState(() => _opacity = 1.0);
        _animationPhase = AnimationPhase.fadeIn;
        nextPhaseDelay = _fadeInDuration;
        break;
      case AnimationPhase.fadeIn:
        _animationPhase = AnimationPhase.visible;
        nextPhaseDelay = _visibleDuration;
        break;
      case AnimationPhase.visible:
        setState(() => _opacity = 0.0);
        _animationPhase = AnimationPhase.fadeOut;
        nextPhaseDelay = _fadeOutDuration;
        break;
      case AnimationPhase.fadeOut:
        setState(
          () => _currentShapeIndex =
              (_currentShapeIndex + 1) % animationShapes.length,
        );
        _animationPhase = AnimationPhase.idle;
        nextPhaseDelay = Duration.zero;
        break;
    }
    _animationTimer = Timer(nextPhaseDelay, _triggerNextAnimationFrame);
  }

  Duration get _currentAnimationDuration {
    switch (_animationPhase) {
      case AnimationPhase.fadeIn:
        return _fadeInDuration;
      case AnimationPhase.fadeOut:
        return _fadeOutDuration;
      default:
        return _fadeOutDuration;
    }
  }

  @override
  void dispose() {
    _deviceNameController.dispose();
    _animationTimer?.cancel();
    registerNotificationActionHandler(null);
    _fileIntentController.dispose();
    _manager.removeNearbyListener(this);
    unawaited(_manager.stopBroadcasting());
    unawaited(_manager.stopDiscovery());
    super.dispose();
  }

  Future<void> _saveDeviceName() async {
    if (!mounted) return;
    FocusScope.of(context).unfocus();
    setState(() => _isTextFieldEditing = false);
    final newName = _deviceNameController.text;
    if (newName.isEmpty) {
      final oldName = await getDeviceName();
      _deviceNameController.text = oldName;
      return;
    }
    await setDeviceName(newName);
    _appSystemTray?.updateDeviceName(newName);

    try {
      _log.info("Restarting broadcast with new name: $newName");
      await _manager.stopBroadcasting();
      await _manager.startBroadcasting(newName);
    } catch (e, s) {
      _log.severe("Error restarting broadcast after name change: $e\n$s");
    }
  }

  @override
  void onDeviceFound(RemoteDeviceInfo device) {
    _log.info("UI Listener: Device Found - ${device.name} (${device.id})");
    setState(() {});
    if (device.qrMatched &&
        _outgoingFilePaths.isNotEmpty &&
        _outgoingConnectionId == null &&
        _outgoingTargetDeviceId == null) {
      _log.info(
        "UI Listener: QR-matched device ${device.id}; starting transfer",
      );
      unawaited(_sendSelectedFilesToDevice(device));
    }
  }

  @override
  void onDeviceLost(String deviceId) {
    _log.info("UI Listener: Device Lost - $deviceId");
    setState(() {});
  }

  @override
  void onTransferRequest(
    TransferMetadata transfer,
    RemoteDeviceInfo device,
    String connectionId,
  ) {
    _log.info(
      "UI Listener: Incoming Transfer Request - ID: ${transfer.id} from ${device.name}",
    );
    final pendingTransfer = transfer.copyWith(id: connectionId);
    setState(() {
      _pendingTransfers[connectionId] = PendingTransfer(
        metadata: pendingTransfer,
        device: device,
      );
    });
    unawaited(
      showTransferNotification(pendingTransfer, device).catchError((e, s) {
        _log.severe("Failed to show transfer notification: $e\n$s");
      }),
    );
  }

  @override
  void onTransferFinished(String connectionId, bool success, Exception? error) {
    _log.info(
      "UI Listener: Transfer Finished - ID: $connectionId, Success: $success, Error: $error",
    );
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
  void onOutgoingTransferStarted(String deviceId, String connectionId) {
    _log.info(
      "UI Listener: Outgoing Transfer Started - DeviceID: $deviceId, ConnID: $connectionId",
    );
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
    _log.info("UI Listener: Outgoing PIN - ConnID: $connectionId, PIN: $pin");
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

  Future<void> _showInboundTransferInFileManager(
    PendingTransfer transfer,
  ) async {
    final localPath = _firstLocalPath(transfer);
    if (localPath == null) return;

    try {
      await revealFileInFileManager(localPath);
    } catch (e, s) {
      _log.severe('Failed to show received file in file manager: $e\n$s');
    }
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

  void _handleNotificationAction(String connectionId, bool accepted) {
    unawaited(
      _respondToPendingTransfer(connectionId, accepted).catchError((e, s) {
        _log.severe(
          "Failed to handle notification action for $connectionId: $e\n$s",
        );
      }),
    );
  }

  Future<void> _pickOutgoingFiles() async {
    setState(() => _isPickingOutgoingFiles = true);
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

    await _showMenuBarPanel(targetSize: outgoingWindowSize);
    if (!mounted) return;

    setState(() {
      _outgoingFilePaths
        ..clear()
        ..addAll(filePaths);
      _outgoingConnectionId = null;
      _outgoingTargetDeviceId = null;
      _outgoingTargetDevice = null;
      _outgoingStatus = 'Looking for nearby devices...';
      _outgoingPin = null;
      _outgoingProgress = null;
      _outgoingError = null;
    });

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

  Future<void> _showMenuBarPanel({Size targetSize = defaultWindowSize}) async {
    final tray = _appSystemTray;
    if (tray != null) {
      await tray.showPanel(targetSize: targetSize);
      return;
    }

    await ensureWindowSizeAtLeast(targetSize);
    await windowManager.show();
    await windowManager.focus();
  }

  Future<void> _sendSelectedFilesToDevice(RemoteDeviceInfo device) async {
    if (_outgoingFilePaths.isEmpty || _outgoingConnectionId != null) return;
    setState(() {
      _outgoingTargetDeviceId = device.id;
      _outgoingTargetDevice = device;
      _outgoingStatus = 'Connecting to ${device.name}...';
      _outgoingPin = null;
      _outgoingProgress = null;
      _outgoingError = null;
    });

    try {
      await _manager.initiateTransfer(device.id, List.of(_outgoingFilePaths));
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
      _outgoingConnectionId = null;
      _outgoingTargetDeviceId = null;
      _outgoingTargetDevice = null;
      _outgoingStatus = null;
      _outgoingPin = null;
      _outgoingProgress = null;
      _outgoingError = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final manager = context.watch<NearbyConnectionManager>();
    final appTheme = context.watch<AppTheme>();
    final showReceiveStatus =
        _outgoingFilePaths.isEmpty && _pendingTransfers.isEmpty;

    return MaterialApp(
      title: AppConfig.name,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: appThemeSeedColor),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: appThemeSeedColor,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: appTheme.mode,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.transparent,
        body: _MenuBarPanelFrame(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                ReceiveStatusHeader(
                  isBroadcasting: manager.isBroadcasting,
                  showReceiveStatus: showReceiveStatus,
                  shapeIndex: _currentShapeIndex,
                  opacity: _opacity,
                  animationDuration: _currentAnimationDuration,
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        if (_outgoingFilePaths.isNotEmpty)
                          OutgoingSendPanel(
                            outgoingFilePaths: _outgoingFilePaths,
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
                            onCancel: () =>
                                unawaited(_clearOutgoingSelection()),
                          ),
                        if (_pendingTransfers.isNotEmpty) ...[
                          if (_outgoingFilePaths.isNotEmpty)
                            const SizedBox(height: 20),
                          for (final entry in _pendingTransfers.entries)
                            TransferRequestPanel(
                              transfer: entry.value.metadata,
                              device: entry.value.device,
                              status: entry.value.status,
                              progress: entry.value.progress,
                              error: entry.value.error,
                              onAccept: () => unawaited(
                                _respondToPendingTransfer(entry.key, true),
                              ),
                              onDecline: () => unawaited(
                                _respondToPendingTransfer(entry.key, false),
                              ),
                              onDismiss: () =>
                                  _dismissInboundTransfer(entry.key),
                              onOpenFile: _firstLocalPath(entry.value) == null
                                  ? null
                                  : () => unawaited(
                                      _openInboundTransferFile(entry.value),
                                    ),
                              onShowInFileManager:
                                  _firstLocalPath(entry.value) == null
                                  ? null
                                  : () => unawaited(
                                      _showInboundTransferInFileManager(
                                        entry.value,
                                      ),
                                    ),
                            ),
                        ],
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    OutgoingSendButton(
                      isPickingOutgoingFiles: _isPickingOutgoingFiles,
                      onPressed: () => unawaited(_pickOutgoingFiles()),
                    ),
                    const SizedBox(height: 12),
                    DeviceNameField(
                      controller: _deviceNameController,
                      isEditing: _isTextFieldEditing,
                      onChanged: (_) =>
                          setState(() => _isTextFieldEditing = true),
                      onSave: () => unawaited(_saveDeviceName()),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MenuBarPanelFrame extends StatelessWidget {
  const _MenuBarPanelFrame({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final surface = colorScheme.surface;
    final borderColor = colorScheme.outlineVariant.withValues(alpha: 0.7);

    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 2, 8, 8),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Center(
              child: CustomPaint(
                size: const Size(18, 10),
                painter: _PanelArrowPainter(
                  color: surface,
                  borderColor: borderColor,
                ),
              ),
            ),
          ),
          Positioned.fill(
            top: 8,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: borderColor),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x1A000000),
                    blurRadius: 14,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Material(color: surface, child: child),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PanelArrowPainter extends CustomPainter {
  const _PanelArrowPainter({required this.color, required this.borderColor});

  final Color color;
  final Color borderColor;

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, Paint()..color = color);
    canvas.drawPath(
      path,
      Paint()
        ..color = borderColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1,
    );
  }

  @override
  bool shouldRepaint(covariant _PanelArrowPainter oldDelegate) {
    return color != oldDelegate.color || borderColor != oldDelegate.borderColor;
  }
}

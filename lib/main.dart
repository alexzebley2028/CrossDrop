import 'dart:async';
import 'dart:io';
import 'package:crossdrop/animations.dart';
import 'package:crossdrop/app_config.dart';
import 'package:crossdrop/app_theme.dart';
import 'package:crossdrop/device.dart'; // Your device name helper
import 'package:crossdrop/nearby_share/api/models.dart';
import 'package:crossdrop/nearby_share/manager/nearby_manager.dart';
import 'package:crossdrop/notifications.dart'; // Import notification helpers
import 'package:crossdrop/window/on_close_window.dart';
import 'package:crossdrop/window/system_tray.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart' as p;
import 'package:provider/provider.dart';
import 'package:window_manager/window_manager.dart';

const MethodChannel _fileIntentChannel = MethodChannel(
  'crossdrop/file_intents',
);
NotificationActionCallback? _activeNotificationActionHandler;
final List<String> _initialOutgoingFilePaths = [];
const Size _defaultWindowSize = Size(420, 640);
const Size _minimumWindowSize = Size(360, 480);
const Size _outgoingWindowSize = Size(440, 700);

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  _initialOutgoingFilePaths.addAll(_filePathsFromArgs(args));

  // Initialize Notifications
  await initializeNotifications(
    _handleNotificationResponse,
  ); // Pass the handler

  // Window Setup
  await windowManager.ensureInitialized();
  WindowOptions windowOptions = WindowOptions(
    backgroundColor: Colors.transparent,
    skipTaskbar: true,
    titleBarStyle: TitleBarStyle.normal,
    windowButtonVisibility: true,
    size: _defaultWindowSize,
    minimumSize: _minimumWindowSize,
    title: AppConfig.name,
  );

  windowManager.waitUntilReadyToShow(windowOptions, () async {
    windowManager.setPreventClose(true);
    windowManager.addListener(OnCloseWindowListener());
    await windowManager.hide();
  });

  runApp(
    // Use MultiProvider to provide both managers/themes at the top level
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NearbyConnectionManager()),
        ChangeNotifierProvider(
          create: (_) => AppTheme(),
        ), // Provide AppTheme here
      ],
      child: const App(), // App and its descendants can now access both
    ),
  );
}

List<String> _filePathsFromArgs(Iterable<Object?> args) {
  final paths = <String>[];
  for (final arg in args) {
    if (arg is! String || arg.isEmpty) continue;
    String path;
    if (arg.startsWith('file:')) {
      try {
        path = Uri.parse(arg).toFilePath();
      } catch (_) {
        continue;
      }
    } else {
      path = arg;
    }

    if (FileSystemEntity.typeSync(path) == FileSystemEntityType.file &&
        !paths.contains(path)) {
      paths.add(path);
    }
  }
  return paths;
}

// Top-level or static handler for notification actions
void _handleNotificationResponse(String connectionId, bool accepted) {
  print('Handling notification response: $connectionId, Accepted: $accepted');
  final activeHandler = _activeNotificationActionHandler;
  if (activeHandler != null) {
    activeHandler(connectionId, accepted);
    return;
  }

  // Fallback for action delivery before the widget tree has registered a handler.
  unawaited(
    NearbyConnectionManager().respondToTransfer(connectionId, accepted),
  );
}

enum AnimationPhase { idle, fadeIn, visible, fadeOut }

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> implements NearbyEventsListener {
  AppSystemTray? appSystemTray;
  final TextEditingController _deviceNameController = TextEditingController();
  bool isTextFieldEditing = false;
  final Map<String, _PendingTransfer> _pendingTransfers = {};
  final List<String> _outgoingFilePaths = [];
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
  double _opacity = 0.0; // Target opacity for AnimatedOpacity

  final Duration _fadeInDuration = const Duration(milliseconds: 1000);
  final Duration _visibleDuration = const Duration(milliseconds: 100);
  final Duration _fadeOutDuration = const Duration(milliseconds: 1000);

  late NearbyConnectionManager _manager;
  bool _nearbyInitialized = false;

  @override
  void initState() {
    super.initState();
    // Manager is accessed later in didChangeDependencies
    _fileIntentChannel.setMethodCallHandler(_handleFileIntentMethodCall);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _consumeInitialOutgoingFilePaths();
      unawaited(_notifyNativeFileIntentReady());
    });
    _triggerNextAnimationFrame();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Access manager here, after Provider is available
    _manager = context.read<NearbyConnectionManager>();
    _activeNotificationActionHandler = _handleNotificationAction;
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
      appSystemTray = AppSystemTray(currentDeviceName); // Initialize tray
      try {
        await appSystemTray?.initSystemTray();
      } catch (e, s) {
        print("Failed to initialize system tray: $e\n$s");
      }
      try {
        print("Starting broadcasting with name: $currentDeviceName");
        await _manager.startBroadcasting(currentDeviceName);
        // Optionally start discovery here too if needed immediately
        // await _manager.startDiscovery();
      } catch (e, s) {
        print("Failed to start broadcasting: $e\n$s");
        // Show error to user?
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
    _activeNotificationActionHandler = null;
    _fileIntentChannel.setMethodCallHandler(null);
    _manager.removeNearbyListener(this); // Unregister listener
    // Decide whether to stop broadcasting/discovery on UI dispose.
    // If using system tray, maybe keep it running? For now, let's stop.
    _manager.stopBroadcasting();
    _manager.stopDiscovery();
    super.dispose();
  }

  Future<void> _saveDeviceName() async {
    if (!mounted) return;
    FocusScope.of(context).unfocus();
    setState(() => isTextFieldEditing = false);
    final newName = _deviceNameController.text;
    if (newName.isEmpty) {
      // Optionally revert or show error
      final oldName = await getDeviceName();
      _deviceNameController.text = oldName;
      return;
    }
    await setDeviceName(newName);
    appSystemTray?.updateDeviceName(newName);

    // Update manager: Stop and restart broadcasting with new name
    // (Or ideally, update TXT record dynamically if Bonsoir supports it)
    try {
      print("Restarting broadcast with new name: $newName");
      // TODO: Check if Bonsoir allows updating TXT record without restart
      await _manager.stopBroadcasting();
      await _manager.startBroadcasting(newName);
    } catch (e, s) {
      print("Error restarting broadcast after name change: $e\n$s");
      // Handle error, maybe revert name?
    }
  }

  // --- NearbyEventsListener Implementation ---

  @override
  void onDeviceFound(RemoteDeviceInfo device) {
    print("UI Listener: Device Found - ${device.name} (${device.id})");
    // TODO: Update UI list of discovered devices (if applicable)
    setState(() {
      // Trigger rebuild if UI depends on discoveredDevices list from manager
    });
  }

  @override
  void onDeviceLost(String deviceId) {
    print("UI Listener: Device Lost - $deviceId");
    // TODO: Update UI list of discovered devices
    setState(() {
      // Trigger rebuild
    });
  }

  @override
  void onTransferRequest(
    TransferMetadata transfer,
    RemoteDeviceInfo device,
    String connectionId,
  ) {
    print(
      "UI Listener: Incoming Transfer Request - ID: ${transfer.id} from ${device.name}",
    );
    final pendingTransfer = transfer.copyWith(id: connectionId);
    setState(() {
      _pendingTransfers[connectionId] = _PendingTransfer(
        metadata: pendingTransfer,
        device: device,
      );
    });
    unawaited(
      showTransferNotification(pendingTransfer, device).catchError((e, s) {
        print("Failed to show transfer notification: $e\n$s");
      }),
    );
  }

  @override
  void onTransferFinished(String connectionId, bool success, Exception? error) {
    print(
      "UI Listener: Transfer Finished - ID: $connectionId, Success: $success, Error: $error",
    );
    var stopOutgoingDiscovery = false;
    if (mounted) {
      setState(() {
        _pendingTransfers.remove(connectionId);
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
    // Clear the transfer notification
    cancelNotification(connectionId);
    if (!success && error != null && error is! NearbyCancellationException) {
      // Show error notification for non-cancellation errors
      // Find device info if possible (might need to store active transfers in manager/UI)
      showErrorNotification(connectionId, null, error.toString());
    }
    // TODO: Update UI related to this transfer
  }

  @override
  void onOutgoingTransferStarted(String deviceId, String connectionId) {
    print(
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
    // print("UI Listener: Outgoing Progress - ConnID: $connectionId, Progress: $progress");
    if (connectionId != _outgoingConnectionId) return;
    setState(() {
      _outgoingStatus = 'Sending...';
      _outgoingProgress = progress.clamp(0, 1).toDouble();
    });
  }

  @override
  void onOutgoingPinAvailable(String connectionId, String pin) {
    print("UI Listener: Outgoing PIN - ConnID: $connectionId, PIN: $pin");
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
        _pendingTransfers.remove(connectionId);
      });
    }
    await _manager.respondToTransfer(connectionId, accept);
    await cancelNotification(connectionId);
  }

  void _handleNotificationAction(String connectionId, bool accepted) {
    unawaited(
      _respondToPendingTransfer(connectionId, accepted).catchError((e, s) {
        print("Failed to handle notification action for $connectionId: $e\n$s");
      }),
    );
  }

  Future<dynamic> _handleFileIntentMethodCall(MethodCall call) async {
    if (call.method != 'openFiles') {
      throw MissingPluginException('Unknown method ${call.method}');
    }
    final args = call.arguments;
    if (args is Iterable) {
      await _startOutgoingFileSelection(_filePathsFromArgs(args));
    }
    return null;
  }

  Future<void> _notifyNativeFileIntentReady() async {
    try {
      await _fileIntentChannel.invokeMethod<void>('ready');
    } on MissingPluginException {
      // The channel is only implemented on platforms with native open-file hooks.
    } catch (e, s) {
      print('Failed to notify native file intent bridge: $e\n$s');
    }
  }

  void _consumeInitialOutgoingFilePaths() {
    if (_initialOutgoingFilePaths.isEmpty) return;
    final paths = List<String>.from(_initialOutgoingFilePaths);
    _initialOutgoingFilePaths.clear();
    unawaited(_startOutgoingFileSelection(paths));
  }

  Future<void> _pickOutgoingFiles() async {
    setState(() => _isPickingOutgoingFiles = true);
    try {
      final files = await openFiles();
      await _startOutgoingFileSelection(files.map((file) => file.path));
    } catch (e, s) {
      print('Failed to pick outgoing files: $e\n$s');
      setState(() {
        _outgoingStatus = 'Could not open file picker';
        _outgoingError = e is Exception ? e : Exception(e.toString());
      });
    } finally {
      if (mounted) setState(() => _isPickingOutgoingFiles = false);
    }
  }

  Future<void> _startOutgoingFileSelection(Iterable<String> paths) async {
    final filePaths = _filePathsFromArgs(paths);
    if (filePaths.isEmpty) return;

    await windowManager.show();
    await _ensureWindowSizeAtLeast(_outgoingWindowSize);
    await windowManager.focus();
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
      print('Failed to start discovery for outgoing transfer: $e\n$s');
      if (!mounted) return;
      setState(() {
        _outgoingStatus = 'Could not start discovery';
        _outgoingError = e is Exception ? e : Exception(e.toString());
      });
    }
  }

  Future<void> _ensureWindowSizeAtLeast(Size targetSize) async {
    try {
      final currentSize = await windowManager.getSize();
      final nextSize = Size(
        currentSize.width < targetSize.width
            ? targetSize.width
            : currentSize.width,
        currentSize.height < targetSize.height
            ? targetSize.height
            : currentSize.height,
      );
      if (nextSize != currentSize) {
        await windowManager.setSize(nextSize);
      }
    } catch (e, s) {
      print('Failed to resize window for outgoing transfer: $e\n$s');
    }
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
      print('Failed to start outgoing transfer: $e\n$s');
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

  Widget _buildOutgoingSendSection(NearbyConnectionManager manager) {
    final selectedFilesLabel = _outgoingFilePaths.length == 1
        ? p.basename(_outgoingFilePaths.single)
        : '${_outgoingFilePaths.length} files selected';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FilledButton.icon(
          onPressed: _isPickingOutgoingFiles
              ? null
              : () => unawaited(_pickOutgoingFiles()),
          icon: const Icon(Icons.upload_file),
          label: Text(
            _isPickingOutgoingFiles ? 'Selecting...' : 'Send files...',
          ),
        ),
        if (_outgoingFilePaths.isNotEmpty) ...[
          const SizedBox(height: 12),
          _OutgoingSendPanel(
            selectedFilesLabel: selectedFilesLabel,
            status: _outgoingStatus,
            pin: _outgoingPin,
            progress: _outgoingProgress,
            error: _outgoingError,
            devices: manager.discoveredDevices,
            isDiscovering: manager.isDiscovering,
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
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // Watch for manager state changes if UI needs to react (e.g., show status)
    final manager = context.watch<NearbyConnectionManager>();
    final appTheme = context.watch<AppTheme>();

    return MaterialApp(
      title: AppConfig.name,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: appTheme.mode,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: Platform.isIOS ? AppBar(/* ... */) : null,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                manager.isBroadcasting
                    ? 'Ready to receive'
                    : 'Not visible', // Example reacting to state
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 140,
                height: 140,
                child: AnimatedOpacity(
                  opacity: _opacity,
                  duration: _currentAnimationDuration,
                  curve: Curves.easeOut,
                  child: Container(
                    width: 140,
                    height: 140,
                    decoration: ShapeDecoration(
                      shape: animationShapes[_currentShapeIndex],
                      color: const Color.fromRGBO(13, 85, 201, 1.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Text(
                manager.isBroadcasting
                    ? 'Receiving from everyone'
                    : 'Start visibility to receive', // Example
                textAlign: TextAlign.start,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              _buildOutgoingSendSection(manager),
              const SizedBox(height: 20),
              Stack(
                alignment: Alignment.center,
                fit: StackFit.passthrough,
                children: [
                  TextField(
                    decoration: const InputDecoration(labelText: 'Device name'),
                    maxLines: 1,
                    controller: _deviceNameController,
                    onChanged: (_) => setState(() => isTextFieldEditing = true),
                    onSubmitted: (_) => _saveDeviceName(), // Save on Enter key
                  ),
                  if (isTextFieldEditing)
                    Positioned(
                      right: 0,
                      child: ElevatedButton(
                        onPressed: _saveDeviceName, // Use common save function
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(8), // Adjust padding
                          minimumSize: const Size(
                            36,
                            36,
                          ), // Ensure minimum size
                          backgroundColor: const Color.fromRGBO(
                            53,
                            132,
                            228,
                            1.0,
                          ),
                          foregroundColor: Colors.white, // Set icon color
                        ),
                        child: const Icon(Icons.done, size: 20),
                      ),
                    ),
                ],
              ),
              if (_pendingTransfers.isNotEmpty) ...[
                const SizedBox(height: 20),
                for (final entry in _pendingTransfers.entries)
                  _TransferRequestPanel(
                    transfer: entry.value.metadata,
                    device: entry.value.device,
                    onAccept: () => _respondToPendingTransfer(entry.key, true),
                    onDecline: () =>
                        _respondToPendingTransfer(entry.key, false),
                  ),
              ],
              // TODO: Add UI for discovered devices and initiating transfers
            ],
          ),
        ),
      ),
    );
  }
}

class _PendingTransfer {
  final TransferMetadata metadata;
  final RemoteDeviceInfo device;

  const _PendingTransfer({required this.metadata, required this.device});
}

class _OutgoingSendPanel extends StatelessWidget {
  final String selectedFilesLabel;
  final String? status;
  final String? pin;
  final double? progress;
  final Exception? error;
  final List<RemoteDeviceInfo> devices;
  final bool isDiscovering;
  final bool busy;
  final String? selectedDeviceId;
  final RemoteDeviceInfo? selectedDevice;
  final ValueChanged<RemoteDeviceInfo> onSendToDevice;
  final VoidCallback onCancel;

  const _OutgoingSendPanel({
    required this.selectedFilesLabel,
    required this.status,
    required this.pin,
    required this.progress,
    required this.error,
    required this.devices,
    required this.isDiscovering,
    required this.busy,
    required this.selectedDeviceId,
    required this.selectedDevice,
    required this.onSendToDevice,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final statusText = status ?? 'Choose a nearby device';
    final visibleDevices = <RemoteDeviceInfo>[...devices];
    final selected = selectedDevice;
    if (selected != null &&
        !visibleDevices.any((device) => device.id == selected.id)) {
      visibleDevices.insert(0, selected);
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(12, 6, 12, 12),
      decoration: BoxDecoration(
        border: Border.all(color: theme.dividerColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.file_present, size: 18),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  selectedFilesLabel,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleSmall,
                ),
              ),
              IconButton(
                tooltip: 'Cancel send',
                onPressed: busy ? null : onCancel,
                visualDensity: VisualDensity.compact,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints.tightFor(
                  width: 34,
                  height: 34,
                ),
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(statusText),
          if (pin != null) ...[
            const SizedBox(height: 4),
            Text('PIN $pin', style: theme.textTheme.titleMedium),
          ],
          if (progress != null) ...[
            const SizedBox(height: 8),
            LinearProgressIndicator(value: progress),
          ],
          if (error != null) ...[
            const SizedBox(height: 8),
            Text(
              error.toString(),
              style: TextStyle(color: theme.colorScheme.error),
            ),
          ],
          const SizedBox(height: 12),
          if (visibleDevices.isEmpty)
            Row(
              children: [
                SizedBox(
                  width: 16,
                  height: 16,
                  child: isDiscovering
                      ? const CircularProgressIndicator(strokeWidth: 2)
                      : null,
                ),
                const SizedBox(width: 8),
                Text(
                  isDiscovering
                      ? 'Scanning for devices...'
                      : 'No nearby devices found',
                ),
              ],
            )
          else
            for (final device in visibleDevices)
              _OutgoingDeviceTile(
                device: device,
                selected: selectedDeviceId == device.id,
                enabled: !busy || selectedDeviceId == device.id,
                onTap: () => onSendToDevice(device),
              ),
        ],
      ),
    );
  }
}

class _OutgoingDeviceTile extends StatelessWidget {
  final RemoteDeviceInfo device;
  final bool selected;
  final bool enabled;
  final VoidCallback onTap;

  const _OutgoingDeviceTile({
    required this.device,
    required this.selected,
    required this.enabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final icon = switch (device.type) {
      DeviceType.phone => Icons.smartphone,
      DeviceType.tablet => Icons.tablet_mac,
      DeviceType.computer => Icons.computer,
      DeviceType.unknown => Icons.devices,
    };

    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon),
      title: Text(device.name, maxLines: 1, overflow: TextOverflow.ellipsis),
      subtitle: selected ? const Text('Selected') : null,
      trailing: selected
          ? const SizedBox(
              width: 18,
              height: 18,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : const Icon(Icons.chevron_right),
      enabled: enabled,
      onTap: enabled ? onTap : null,
    );
  }
}

class _TransferRequestPanel extends StatelessWidget {
  final TransferMetadata transfer;
  final RemoteDeviceInfo device;
  final Future<void> Function() onAccept;
  final Future<void> Function() onDecline;

  const _TransferRequestPanel({
    required this.transfer,
    required this.device,
    required this.onAccept,
    required this.onDecline,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final detail = transfer.textDescription != null
        ? transfer.textDescription!
        : transfer.files.length == 1
        ? transfer.files.first.name
        : '${transfer.files.length} files';

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: theme.dividerColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${device.name} wants to share',
            style: theme.textTheme.titleSmall,
          ),
          const SizedBox(height: 4),
          Text(detail, maxLines: 2, overflow: TextOverflow.ellipsis),
          if (transfer.pinCode != null) ...[
            const SizedBox(height: 4),
            Text('PIN ${transfer.pinCode}'),
          ],
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => unawaited(onDecline()),
                child: const Text('Decline'),
              ),
              const SizedBox(width: 8),
              FilledButton(
                onPressed: () => unawaited(onAccept()),
                child: const Text('Accept'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Helper extension for TransferMetadata if needed for notifications
extension TransferMetadataExt on TransferMetadata {
  TransferMetadata copyWith({
    List<ShareFileMetadata>? files,
    String? id,
    String? pinCode,
    String? textDescription,
  }) {
    return TransferMetadata(
      files: files ?? this.files,
      id: id ?? this.id,
      pinCode: pinCode ?? this.pinCode,
      textDescription: textDescription ?? this.textDescription,
    );
  }
}

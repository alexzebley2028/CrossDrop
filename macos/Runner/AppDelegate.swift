import Cocoa
import CoreBluetooth
import FlutterMacOS
import ServiceManagement

@main
class AppDelegate: FlutterAppDelegate {
  private var fileIntentChannel: FlutterMethodChannel?
  private var autostartChannel: FlutterMethodChannel?
  private var bleScanChannel: FlutterMethodChannel?
  private var nearbyShareScanner: NearbyShareBleScanner?
  private var pendingOpenFiles: [String] = []
  private var pendingShareText: [String] = []
  private var dartFileIntentHandlerReady = false

  override func applicationDidFinishLaunching(_ notification: Notification) {
    super.applicationDidFinishLaunching(notification)

    NSApp.servicesProvider = self
    NSUpdateDynamicServices()
  }

  func registerFlutterChannels(controller: FlutterViewController) {
    if fileIntentChannel != nil {
      return
    }

    let channel = FlutterMethodChannel(
      name: "crossdrop/file_intents",
      binaryMessenger: controller.engine.binaryMessenger
    )
    channel.setMethodCallHandler { [weak self] call, result in
      guard let self = self else {
        result(nil)
        return
      }

      if call.method == "ready" {
        self.dartFileIntentHandlerReady = true
        self.flushPendingOpenFiles()
        result(nil)
      } else {
        result(FlutterMethodNotImplemented)
      }
    }
    fileIntentChannel = channel

    registerAutostartChannel(controller: controller)
    registerBleScanChannel(controller: controller)
  }

  private func registerBleScanChannel(controller: FlutterViewController) {
    let channel = FlutterMethodChannel(
      name: "crossdrop/ble_scan",
      binaryMessenger: controller.engine.binaryMessenger
    )
    let scanner = NearbyShareBleScanner(channel: channel)
    nearbyShareScanner = scanner
    channel.setMethodCallHandler { call, result in
      switch call.method {
      case "start":
        result(scanner.start())
      case "stop":
        scanner.stop()
        result(nil)
      default:
        result(FlutterMethodNotImplemented)
      }
    }
    bleScanChannel = channel
  }

  private func registerAutostartChannel(controller: FlutterViewController) {
    let channel = FlutterMethodChannel(
      name: "crossdrop/autostart",
      binaryMessenger: controller.engine.binaryMessenger
    )
    channel.setMethodCallHandler { call, result in
      guard #available(macOS 13.0, *) else {
        // SMAppService login items require macOS 13+.
        result(false)
        return
      }

      // A login item is "on" when registered, even if it still needs the user's
      // approval in System Settings › Login Items.
      func isLoginItemOn() -> Bool {
        let status = SMAppService.mainApp.status
        return status == .enabled || status == .requiresApproval
      }

      switch call.method {
      case "isEnabled":
        result(isLoginItemOn())
      case "setEnabled":
        let enabled =
          (call.arguments as? [String: Any])?["enabled"] as? Bool ?? false
        do {
          if enabled {
            if !isLoginItemOn() {
              try SMAppService.mainApp.register()
            }
          } else if isLoginItemOn() {
            try SMAppService.mainApp.unregister()
          }
          // Return the resulting state, not merely "success" — the Dart layer
          // treats the return value as the new launch-at-login setting.
          result(enabled)
        } catch {
          NSLog("CrossDrop autostart change failed: \(error)")
          result(isLoginItemOn())
        }
      default:
        result(FlutterMethodNotImplemented)
      }
    }
    autostartChannel = channel
  }

  override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
    return false
  }

  override func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
    return true
  }

  override func application(_ sender: NSApplication, openFiles filenames: [String]) {
    enqueueOpenFiles(filenames)
    sender.reply(toOpenOrPrint: .success)
  }

  override func application(_ application: NSApplication, open urls: [URL]) {
    enqueueOpenFiles(urls.filter { $0.isFileURL }.map { $0.path })
  }

  @objc func sendFiles(
    _ pasteboard: NSPasteboard,
    userData: String?,
    error: AutoreleasingUnsafeMutablePointer<NSString?>
  ) {
    let fileUrlOnly = NSPasteboard.ReadingOptionKey.urlReadingFileURLsOnly
    let objects = pasteboard.readObjects(
      forClasses: [NSURL.self],
      options: [fileUrlOnly: true]
    ) ?? []
    let filePaths = objects.compactMap { object -> String? in
      guard let url = object as? URL, url.isFileURL else {
        return nil
      }
      var isDirectory = ObjCBool(false)
      guard FileManager.default.fileExists(
        atPath: url.path,
        isDirectory: &isDirectory
      ), !isDirectory.boolValue else {
        return nil
      }
      return url.path
    }

    guard !filePaths.isEmpty else {
      error.pointee = "CrossDrop could not read selected files." as NSString
      return
    }

    enqueueOpenFiles(filePaths)
  }

  @objc func sendText(
    _ pasteboard: NSPasteboard,
    userData: String?,
    error: AutoreleasingUnsafeMutablePointer<NSString?>
  ) {
    guard let text = pasteboard.string(forType: .string), !text.isEmpty else {
      error.pointee = "CrossDrop could not read the selected text." as NSString
      return
    }
    enqueueShareText(text)
  }

  private func enqueueShareText(_ text: String) {
    if dartFileIntentHandlerReady {
      fileIntentChannel?.invokeMethod("shareText", arguments: text)
    } else {
      pendingShareText.append(text)
    }
  }

  private func enqueueOpenFiles(_ filenames: [String]) {
    let filePaths = filenames.filter { path in
      var isDirectory = ObjCBool(false)
      return FileManager.default.fileExists(
        atPath: path,
        isDirectory: &isDirectory
      ) && !isDirectory.boolValue
    }
    guard !filePaths.isEmpty else {
      return
    }

    if dartFileIntentHandlerReady {
      fileIntentChannel?.invokeMethod("openFiles", arguments: filePaths)
    } else {
      pendingOpenFiles.append(contentsOf: filePaths)
    }
  }

  private func flushPendingOpenFiles() {
    if !pendingOpenFiles.isEmpty {
      let filePaths = pendingOpenFiles
      pendingOpenFiles.removeAll()
      fileIntentChannel?.invokeMethod("openFiles", arguments: filePaths)
    }

    if !pendingShareText.isEmpty {
      let texts = pendingShareText
      pendingShareText.removeAll()
      for text in texts {
        fileIntentChannel?.invokeMethod("shareText", arguments: text)
      }
    }
  }
}

/// Scans for the Quick Share "Fast Init" BLE beacon that a nearby device emits
/// while starting a share, so a hidden CrossDrop can wake and become briefly
/// discoverable. BLE *advertising* of custom service data is restricted on
/// Apple platforms, but scanning in the central role is allowed.
final class NearbyShareBleScanner: NSObject, CBCentralManagerDelegate {
  // The 16-bit Quick Share service UUID (0xFE2C).
  private let serviceUUID = CBUUID(string: "FE2C")
  private weak var channel: FlutterMethodChannel?
  private var central: CBCentralManager?
  private var wantsScan = false
  private var lastAlert = Date.distantPast

  init(channel: FlutterMethodChannel) {
    self.channel = channel
    super.init()
  }

  /// Begins scanning. Returns true optimistically; the scan actually starts once
  /// the Bluetooth radio reports `.poweredOn` (and the user grants permission).
  func start() -> Bool {
    wantsScan = true
    if central == nil {
      central = CBCentralManager(delegate: self, queue: nil)
    } else {
      startScanIfReady()
    }
    return true
  }

  func stop() {
    wantsScan = false
    central?.stopScan()
  }

  private func startScanIfReady() {
    guard wantsScan, let central = central, central.state == .poweredOn else {
      return
    }
    central.scanForPeripherals(
      withServices: [serviceUUID],
      options: [CBCentralManagerScanOptionAllowDuplicatesKey: false]
    )
  }

  func centralManagerDidUpdateState(_ central: CBCentralManager) {
    if central.state == .poweredOn {
      startScanIfReady()
    }
  }

  func centralManager(
    _ central: CBCentralManager,
    didDiscover peripheral: CBPeripheral,
    advertisementData: [String: Any],
    rssi RSSI: NSNumber
  ) {
    // Sanity-check that the advertisement really carries Quick Share service
    // data, not just any device matching the UUID filter.
    guard
      let serviceData =
        advertisementData[CBAdvertisementDataServiceDataKey] as? [CBUUID: Data],
      serviceData[serviceUUID] != nil
    else {
      return
    }

    // Debounce: a sender advertises continuously, so wake at most once per 30s.
    let now = Date()
    if now.timeIntervalSince(lastAlert) <= 30 {
      return
    }
    lastAlert = now
    channel?.invokeMethod("onNearbySharing", arguments: nil)
  }
}

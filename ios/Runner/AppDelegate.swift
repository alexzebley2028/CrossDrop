import CoreBluetooth
import Flutter
import QuickLook
import UIKit
import UserNotifications

@main
@objc class AppDelegate: FlutterAppDelegate, FlutterImplicitEngineDelegate, QLPreviewControllerDataSource {
  private var fileActionsChannel: FlutterMethodChannel?
  private var bleScanChannel: FlutterMethodChannel?
  private var nearbyShareScanner: NearbyShareBleScanner?
  private var previewFileURL: URL?

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    UNUserNotificationCenter.current().delegate = self
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  func didInitializeImplicitFlutterEngine(_ engineBridge: FlutterImplicitEngineBridge) {
    GeneratedPluginRegistrant.register(with: engineBridge.pluginRegistry)
    registerFileActionsChannel(engineBridge)
    registerBleScanChannel(engineBridge)
  }

  private func registerBleScanChannel(_ engineBridge: FlutterImplicitEngineBridge) {
    guard bleScanChannel == nil else { return }

    let channel = FlutterMethodChannel(
      name: "crossdrop/ble_scan",
      binaryMessenger: engineBridge.applicationRegistrar.messenger()
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

  private func registerFileActionsChannel(_ engineBridge: FlutterImplicitEngineBridge) {
    guard fileActionsChannel == nil else { return }

    let channel = FlutterMethodChannel(
      name: "crossdrop/file_actions",
      binaryMessenger: engineBridge.applicationRegistrar.messenger()
    )
    channel.setMethodCallHandler { [weak self] call, result in
      guard call.method == "openFile" else {
        result(FlutterMethodNotImplemented)
        return
      }
      guard
        let arguments = call.arguments as? [String: Any],
        let path = arguments["path"] as? String
      else {
        result(FlutterError(code: "bad_args", message: "Missing file path", details: nil))
        return
      }
      self?.openFile(path: path, result: result)
    }
    fileActionsChannel = channel
  }

  private func openFile(path: String, result: @escaping FlutterResult) {
    let url = URL(fileURLWithPath: path)
    guard FileManager.default.fileExists(atPath: url.path) else {
      result(FlutterError(code: "not_found", message: "File does not exist", details: path))
      return
    }

    DispatchQueue.main.async { [weak self] in
      guard let self else {
        result(nil)
        return
      }
      guard let presenter = self.topViewController(from: self.rootViewController()) else {
        result(FlutterError(code: "no_presenter", message: "No view controller available", details: nil))
        return
      }

      self.previewFileURL = url
      let previewController = QLPreviewController()
      previewController.dataSource = self
      presenter.present(previewController, animated: true) {
        result(nil)
      }
    }
  }

  func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
    return previewFileURL == nil ? 0 : 1
  }

  func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
    return previewFileURL! as NSURL
  }

  private func rootViewController() -> UIViewController? {
    let keyWindow = UIApplication.shared.connectedScenes
      .compactMap { $0 as? UIWindowScene }
      .flatMap { $0.windows }
      .first { $0.isKeyWindow }
    return keyWindow?.rootViewController
  }

  private func topViewController(from viewController: UIViewController?) -> UIViewController? {
    if let navigationController = viewController as? UINavigationController {
      return topViewController(from: navigationController.visibleViewController)
    }
    if let tabBarController = viewController as? UITabBarController {
      return topViewController(from: tabBarController.selectedViewController)
    }
    if let presentedViewController = viewController?.presentedViewController {
      return topViewController(from: presentedViewController)
    }
    return viewController
  }
}

/// Scans for the Quick Share "Fast Init" BLE beacon a nearby device emits while
/// starting a share, so a hidden CrossDrop can wake and briefly become
/// discoverable. Scanning (central role) is permitted on iOS even though
/// advertising custom service data is not.
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

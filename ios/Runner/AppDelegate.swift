import Flutter
import QuickLook
import UIKit
import UserNotifications

@main
@objc class AppDelegate: FlutterAppDelegate, FlutterImplicitEngineDelegate, QLPreviewControllerDataSource {
  private var fileActionsChannel: FlutterMethodChannel?
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

import Cocoa
import FlutterMacOS

@main
class AppDelegate: FlutterAppDelegate {
  private var fileIntentChannel: FlutterMethodChannel?
  private var pendingOpenFiles: [String] = []
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
    guard !pendingOpenFiles.isEmpty else {
      return
    }

    let filePaths = pendingOpenFiles
    pendingOpenFiles.removeAll()
    fileIntentChannel?.invokeMethod("openFiles", arguments: filePaths)
  }
}

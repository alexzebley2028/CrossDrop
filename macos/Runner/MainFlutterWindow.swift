import Cocoa
import FlutterMacOS
import window_manager

class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
    let flutterViewController = FlutterViewController()
    let windowFrame = self.frame

    isOpaque = false
    backgroundColor = .clear
    hasShadow = false
    titleVisibility = .hidden
    titlebarAppearsTransparent = true

    flutterViewController.backgroundColor = .clear
    flutterViewController.view.wantsLayer = true
    flutterViewController.view.layer?.isOpaque = false
    flutterViewController.view.layer?.backgroundColor = NSColor.clear.cgColor

    self.contentViewController = flutterViewController
    self.setFrame(windowFrame, display: true)

    RegisterGeneratedPlugins(registry: flutterViewController)
    if let appDelegate = NSApplication.shared.delegate as? AppDelegate {
      appDelegate.registerFlutterChannels(controller: flutterViewController)
    }

    super.awakeFromNib()
  }

  override public func order(_ place: NSWindow.OrderingMode, relativeTo otherWin: Int) {
    super.order(place, relativeTo: otherWin)
    hiddenWindowAtLaunch()
  }
}

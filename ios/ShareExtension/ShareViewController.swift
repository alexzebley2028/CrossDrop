// CrossDrop iOS Share Extension
// ------------------------------
// This file is provided as ready-to-wire scaffolding. It is intentionally NOT
// added to the Xcode project / Runner build yet, because creating an app
// extension target also requires an App Group capability and a host-app URL
// handler that must be configured and verified inside Xcode. See
// docs/SHARE_EXTENSION.md for the step-by-step integration guide.
//
// Behaviour: when the user shares files, URLs, or text into CrossDrop from
// another app, this controller copies/serialises the items into the shared App
// Group container and re-opens the host app via the `crossdrop://share` URL
// scheme. The host app then reads the manifest and starts an outgoing transfer.

import MobileCoreServices
import Social
import UIKit
import UniformTypeIdentifiers

/// Keep this in sync with the App Group configured on both the app and the
/// extension target (see docs/SHARE_EXTENSION.md).
private let appGroupId = "group.de.medformatik.crossdrop"
private let sharedDefaultsKey = "crossdrop.sharedItems"
private let hostUrlScheme = "crossdrop://share"

class ShareViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    handleSharedItems()
  }

  private func handleSharedItems() {
    guard
      let extensionItems = extensionContext?.inputItems as? [NSExtensionItem]
    else {
      complete()
      return
    }

    let group = DispatchGroup()
    // loadItem completions run concurrently on background queues, so guard the
    // shared collections with a serial queue and accumulate every text/URL
    // item rather than overwriting.
    let sync = DispatchQueue(label: "crossdrop.share.collect")
    var sharedFilePaths: [String] = []
    var sharedTexts: [String] = []

    for item in extensionItems {
      for provider in item.attachments ?? [] {
        if provider.hasItemConformingToTypeIdentifier(UTType.fileURL.identifier) {
          group.enter()
          provider.loadItem(
            forTypeIdentifier: UTType.fileURL.identifier, options: nil
          ) { data, _ in
            if let url = data as? URL,
              let copied = self.copyToAppGroup(url) {
              sync.sync { sharedFilePaths.append(copied) }
            }
            group.leave()
          }
        } else if provider.hasItemConformingToTypeIdentifier(
          UTType.url.identifier)
        {
          group.enter()
          provider.loadItem(
            forTypeIdentifier: UTType.url.identifier, options: nil
          ) { data, _ in
            if let url = data as? URL {
              sync.sync { sharedTexts.append(url.absoluteString) }
            }
            group.leave()
          }
        } else if provider.hasItemConformingToTypeIdentifier(
          UTType.plainText.identifier)
        {
          group.enter()
          provider.loadItem(
            forTypeIdentifier: UTType.plainText.identifier, options: nil
          ) { data, _ in
            if let text = data as? String {
              sync.sync { sharedTexts.append(text) }
            }
            group.leave()
          }
        }
      }
    }

    group.notify(queue: .main) {
      let text = sharedTexts.isEmpty ? nil : sharedTexts.joined(separator: "\n")
      self.persist(filePaths: sharedFilePaths, text: text)
      self.openHostApp()
      self.complete()
    }
  }

  private func copyToAppGroup(_ url: URL) -> String? {
    guard
      let container = FileManager.default.containerURL(
        forSecurityApplicationGroupIdentifier: appGroupId)
    else { return nil }
    let inbox = container.appendingPathComponent("ShareInbox", isDirectory: true)
    try? FileManager.default.createDirectory(
      at: inbox, withIntermediateDirectories: true)
    let destination = inbox.appendingPathComponent(url.lastPathComponent)
    try? FileManager.default.removeItem(at: destination)
    do {
      try FileManager.default.copyItem(at: url, to: destination)
      return destination.path
    } catch {
      return nil
    }
  }

  private func persist(filePaths: [String], text: String?) {
    let defaults = UserDefaults(suiteName: appGroupId)
    var payload: [String: Any] = ["files": filePaths]
    if let text = text { payload["text"] = text }
    defaults?.set(payload, forKey: sharedDefaultsKey)
  }

  private func openHostApp() {
    guard let url = URL(string: hostUrlScheme) else { return }
    var responder: UIResponder? = self
    while let current = responder {
      if let application = current as? UIApplication {
        application.open(url, options: [:], completionHandler: nil)
        return
      }
      responder = current.next
    }
  }

  private func complete() {
    extensionContext?.completeRequest(returningItems: nil, completionHandler: nil)
  }
}

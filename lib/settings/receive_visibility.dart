/// How discoverable CrossDrop is to nearby senders.
///
/// Mirrors the visibility model used by rquickshare
/// (https://github.com/Martichou/rquickshare): a device can be permanently
/// visible, hidden, or visible for a short window before reverting to hidden.
///
/// Unlike Google's account-based "Contacts" visibility (which requires talking
/// to Google servers), these modes only control whether we advertise the mDNS
/// service, so they work fully offline and on every platform.
enum ReceiveVisibility {
  /// Always advertise while the app is running. Anyone on the LAN can send.
  everyone,

  /// Never advertise. The device cannot be discovered by senders.
  hidden,

  /// Advertise for a limited window, then automatically revert to [hidden].
  temporary;

  /// Whether this mode means we should currently be broadcasting the service.
  bool get shouldBroadcast =>
      this == ReceiveVisibility.everyone || this == ReceiveVisibility.temporary;

  /// Stable string used for persistence.
  String get storageValue => name;

  static ReceiveVisibility fromStorage(String? value) {
    switch (value) {
      case 'hidden':
        return ReceiveVisibility.hidden;
      case 'temporary':
        return ReceiveVisibility.temporary;
      case 'everyone':
      default:
        return ReceiveVisibility.everyone;
    }
  }
}

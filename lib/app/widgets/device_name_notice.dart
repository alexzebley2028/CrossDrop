import 'package:crossdrop/settings/receive_visibility.dart';
import 'package:flutter/material.dart';

/// A read-only line telling the user what this device is currently discoverable
/// as. The editable device-name field lives in Settings.
class DeviceNameNotice extends StatelessWidget {
  final String deviceName;
  final ReceiveVisibility visibility;

  const DeviceNameNotice({
    super.key,
    required this.deviceName,
    required this.visibility,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final muted = theme.textTheme.bodySmall?.copyWith(
      color: theme.colorScheme.onSurfaceVariant,
    );
    final hidden = visibility == ReceiveVisibility.hidden;
    final name = deviceName.isEmpty ? 'this device' : deviceName;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          hidden ? Icons.visibility_off_outlined : Icons.wifi_tethering,
          size: 14,
          color: theme.colorScheme.onSurfaceVariant,
        ),
        const SizedBox(width: 6),
        Flexible(
          child: Text(
            hidden ? 'Hidden · $name' : 'Visible as $name',
            style: muted,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

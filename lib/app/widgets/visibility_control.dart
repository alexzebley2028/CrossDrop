import 'package:crossdrop/settings/receive_visibility.dart';
import 'package:flutter/material.dart';

/// A segmented control for choosing the receive [ReceiveVisibility] mode, with a
/// short caption describing the current selection.
class VisibilityControl extends StatelessWidget {
  final ReceiveVisibility visibility;
  final ValueChanged<ReceiveVisibility> onChanged;
  final Duration temporaryDuration;

  const VisibilityControl({
    super.key,
    required this.visibility,
    required this.onChanged,
    this.temporaryDuration = const Duration(seconds: 60),
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        SegmentedButton<ReceiveVisibility>(
          showSelectedIcon: false,
          segments: const [
            ButtonSegment(
              value: ReceiveVisibility.everyone,
              icon: Icon(Icons.public, size: 18),
              label: Text('Everyone'),
            ),
            ButtonSegment(
              value: ReceiveVisibility.temporary,
              icon: Icon(Icons.timer_outlined, size: 18),
              label: Text('1 min'),
            ),
            ButtonSegment(
              value: ReceiveVisibility.hidden,
              icon: Icon(Icons.visibility_off_outlined, size: 18),
              label: Text('Hidden'),
            ),
          ],
          selected: {visibility},
          onSelectionChanged: (selection) => onChanged(selection.first),
        ),
        const SizedBox(height: 6),
        Text(
          _caption,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  String get _caption {
    switch (visibility) {
      case ReceiveVisibility.everyone:
        return 'Anyone on your network can send to this device.';
      case ReceiveVisibility.temporary:
        final seconds = temporaryDuration.inSeconds;
        return 'Discoverable for ${seconds}s, then hides automatically.';
      case ReceiveVisibility.hidden:
        return 'Not discoverable. Senders on your network can\'t find you.';
    }
  }
}

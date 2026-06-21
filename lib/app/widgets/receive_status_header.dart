import 'package:crossdrop/animations.dart';
import 'package:crossdrop/app_theme.dart';
import 'package:crossdrop/settings/receive_visibility.dart';
import 'package:flutter/material.dart';

class ReceiveStatusHeader extends StatelessWidget {
  final bool isBroadcasting;
  final ReceiveVisibility visibility;
  final bool showReceiveStatus;
  final int shapeIndex;
  final double opacity;
  final Duration animationDuration;
  final VoidCallback? onOpenSettings;

  const ReceiveStatusHeader({
    super.key,
    required this.isBroadcasting,
    required this.visibility,
    required this.showReceiveStatus,
    required this.shapeIndex,
    required this.opacity,
    required this.animationDuration,
    this.onOpenSettings,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            const Text(
              'CrossDrop',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            if (onOpenSettings != null)
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  tooltip: 'Settings',
                  visualDensity: VisualDensity.compact,
                  onPressed: onOpenSettings,
                  icon: const Icon(Icons.settings_outlined, size: 20),
                ),
              ),
          ],
        ),
        if (showReceiveStatus) ...[
          const SizedBox(height: 20),
          SizedBox(
            width: 140,
            height: 140,
            child: AnimatedOpacity(
              opacity: isBroadcasting ? opacity : 0.25,
              duration: animationDuration,
              curve: Curves.easeOut,
              child: Container(
                width: 140,
                height: 140,
                decoration: ShapeDecoration(
                  shape: animationShapes[shapeIndex],
                  color: appThemeSeedColor,
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          Text(
            _statusText,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ],
    );
  }

  String get _statusText {
    switch (visibility) {
      case ReceiveVisibility.everyone:
        return 'Receiving from everyone';
      case ReceiveVisibility.temporary:
        return 'Visible briefly';
      case ReceiveVisibility.hidden:
        return 'Hidden — open settings to become visible';
    }
  }
}

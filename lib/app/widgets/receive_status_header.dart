import 'package:crossdrop/animations.dart';
import 'package:crossdrop/app_theme.dart';
import 'package:flutter/material.dart';

class ReceiveStatusHeader extends StatelessWidget {
  final bool isBroadcasting;
  final bool showReceiveStatus;
  final int shapeIndex;
  final double opacity;
  final Duration animationDuration;

  const ReceiveStatusHeader({
    super.key,
    required this.isBroadcasting,
    required this.showReceiveStatus,
    required this.shapeIndex,
    required this.opacity,
    required this.animationDuration,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'CrossDrop',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        if (showReceiveStatus) ...[
          const SizedBox(height: 20),
          SizedBox(
            width: 140,
            height: 140,
            child: AnimatedOpacity(
              opacity: opacity,
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
            isBroadcasting
                ? 'Receiving from everyone'
                : 'Start visibility to receive',
            textAlign: TextAlign.start,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ],
    );
  }
}

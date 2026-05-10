import 'package:crossdrop/animations.dart';
import 'package:flutter/material.dart';

class ReceiveStatusHeader extends StatelessWidget {
  final bool isBroadcasting;
  final int shapeIndex;
  final double opacity;
  final Duration animationDuration;

  const ReceiveStatusHeader({
    super.key,
    required this.isBroadcasting,
    required this.shapeIndex,
    required this.opacity,
    required this.animationDuration,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          isBroadcasting ? 'Ready to receive' : 'Not visible',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
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
                color: const Color.fromRGBO(13, 85, 201, 1.0),
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
    );
  }
}

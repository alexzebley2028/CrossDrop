import 'package:flutter/material.dart';

class DeviceNameField extends StatelessWidget {
  final TextEditingController controller;
  final bool isEditing;
  final ValueChanged<String> onChanged;
  final VoidCallback onSave;

  const DeviceNameField({
    super.key,
    required this.controller,
    required this.isEditing,
    required this.onChanged,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.passthrough,
      children: [
        TextField(
          decoration: const InputDecoration(labelText: 'Device name'),
          maxLines: 1,
          controller: controller,
          onChanged: onChanged,
          onSubmitted: (_) => onSave(),
        ),
        if (isEditing)
          Positioned(
            right: 0,
            child: ElevatedButton(
              onPressed: onSave,
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(8),
                minimumSize: const Size(36, 36),
                backgroundColor: const Color.fromRGBO(53, 132, 228, 1.0),
                foregroundColor: Colors.white,
              ),
              child: const Icon(Icons.done, size: 20),
            ),
          ),
      ],
    );
  }
}

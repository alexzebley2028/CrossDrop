import 'package:flutter/material.dart';

/// Prompts the user for text/URL to send. Returns the entered text, or null if
/// the dialog was cancelled.
///
/// The dialog owns its [TextEditingController] (disposing it in its own
/// `dispose`), so the controller stays alive for the route's exit animation
/// instead of being torn down the instant `showDialog` resolves.
Future<String?> promptForSendText(BuildContext context) {
  return showDialog<String>(
    context: context,
    builder: (_) => const SendTextDialog(),
  );
}

class SendTextDialog extends StatefulWidget {
  const SendTextDialog({super.key});

  @override
  State<SendTextDialog> createState() => _SendTextDialogState();
}

class _SendTextDialogState extends State<SendTextDialog> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() => Navigator.of(context).pop(_controller.text);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Send text or link'),
      content: TextField(
        controller: _controller,
        autofocus: true,
        minLines: 1,
        maxLines: 6,
        textInputAction: TextInputAction.send,
        decoration: const InputDecoration(
          hintText: 'Type text or paste a link…',
        ),
        onSubmitted: (_) => _submit(),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        FilledButton(onPressed: _submit, child: const Text('Continue')),
      ],
    );
  }
}

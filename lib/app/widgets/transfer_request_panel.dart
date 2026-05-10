import 'package:crossdrop/nearby_share/api/models.dart';
import 'package:flutter/material.dart';

class TransferRequestPanel extends StatelessWidget {
  final TransferMetadata transfer;
  final RemoteDeviceInfo device;
  final VoidCallback onAccept;
  final VoidCallback onDecline;

  const TransferRequestPanel({
    super.key,
    required this.transfer,
    required this.device,
    required this.onAccept,
    required this.onDecline,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final detail = transfer.textDescription != null
        ? transfer.textDescription!
        : transfer.files.length == 1
        ? transfer.files.first.name
        : '${transfer.files.length} files';

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: theme.dividerColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${device.name} wants to share',
            style: theme.textTheme.titleSmall,
          ),
          const SizedBox(height: 4),
          Text(detail, maxLines: 2, overflow: TextOverflow.ellipsis),
          if (transfer.pinCode != null) ...[
            const SizedBox(height: 4),
            Text('PIN ${transfer.pinCode}'),
          ],
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(onPressed: onDecline, child: const Text('Decline')),
              const SizedBox(width: 8),
              FilledButton(onPressed: onAccept, child: const Text('Accept')),
            ],
          ),
        ],
      ),
    );
  }
}

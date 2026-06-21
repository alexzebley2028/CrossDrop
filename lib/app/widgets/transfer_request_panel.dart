import 'dart:io';

import 'package:crossdrop/app/pending_transfer.dart';
import 'package:crossdrop/nearby_share/api/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class TransferRequestPanel extends StatelessWidget {
  final TransferMetadata transfer;
  final RemoteDeviceInfo device;
  final PendingTransferStatus status;
  final double? progress;
  final String? error;
  final ReceivedPayload? receivedPayload;
  final VoidCallback onAccept;
  final VoidCallback onDecline;
  final VoidCallback onDismiss;
  final VoidCallback? onOpenFile;
  final VoidCallback? onShowInFileManager;

  const TransferRequestPanel({
    super.key,
    required this.transfer,
    required this.device,
    required this.status,
    this.progress,
    this.error,
    this.receivedPayload,
    required this.onAccept,
    required this.onDecline,
    required this.onDismiss,
    this.onOpenFile,
    this.onShowInFileManager,
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Text(_title, style: theme.textTheme.titleSmall)),
              if (_canDismiss)
                IconButton(
                  tooltip: 'Dismiss',
                  visualDensity: VisualDensity.compact,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints.tightFor(
                    width: 32,
                    height: 32,
                  ),
                  onPressed: onDismiss,
                  icon: const Icon(Icons.close, size: 18),
                ),
            ],
          ),
          const SizedBox(height: 4),
          Text(detail, maxLines: 2, overflow: TextOverflow.ellipsis),
          if (transfer.pinCode != null) ...[
            const SizedBox(height: 4),
            Text('PIN ${transfer.pinCode}'),
          ],
          if (receivedPayload != null) ...[
            const SizedBox(height: 10),
            _ReceivedPayloadView(payload: receivedPayload!),
          ],
          const SizedBox(height: 10),
          _TransferStatusRow(
            status: status,
            progress: progress,
            error: error,
            hasReceivedPayload: receivedPayload != null,
            onAccept: onAccept,
            onDecline: onDecline,
            onOpenFile: onOpenFile,
            onShowInFileManager: onShowInFileManager,
          ),
        ],
      ),
    );
  }

  String get _title {
    switch (status) {
      case PendingTransferStatus.awaitingConsent:
        return '${device.name} wants to share';
      case PendingTransferStatus.receiving:
        return 'Receiving from ${device.name}';
      case PendingTransferStatus.finished:
        return 'Received from ${device.name}';
      case PendingTransferStatus.failed:
        return 'Transfer from ${device.name} failed';
    }
  }

  bool get _canDismiss {
    return status == PendingTransferStatus.finished ||
        status == PendingTransferStatus.failed;
  }
}

class _TransferStatusRow extends StatelessWidget {
  final PendingTransferStatus status;
  final double? progress;
  final String? error;
  final bool hasReceivedPayload;
  final VoidCallback onAccept;
  final VoidCallback onDecline;
  final VoidCallback? onOpenFile;
  final VoidCallback? onShowInFileManager;

  const _TransferStatusRow({
    required this.status,
    required this.progress,
    required this.error,
    required this.hasReceivedPayload,
    required this.onAccept,
    required this.onDecline,
    required this.onOpenFile,
    required this.onShowInFileManager,
  });

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case PendingTransferStatus.awaitingConsent:
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(onPressed: onDecline, child: const Text('Decline')),
            const SizedBox(width: 8),
            FilledButton(onPressed: onAccept, child: const Text('Accept')),
          ],
        );
      case PendingTransferStatus.receiving:
        final clampedProgress = progress?.clamp(0, 1).toDouble();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LinearProgressIndicator(value: clampedProgress),
            const SizedBox(height: 8),
            Text(
              clampedProgress == null
                  ? 'Receiving...'
                  : 'Receiving ${(clampedProgress * 100).round()}%',
            ),
          ],
        );
      case PendingTransferStatus.finished:
        if (onOpenFile == null && onShowInFileManager == null) {
          // A received text/URL/Wi-Fi payload renders its own actions above.
          if (hasReceivedPayload) return const SizedBox.shrink();
          return const Text('Saved in CrossDrop');
        }
        return Align(
          alignment: Alignment.centerRight,
          child: Wrap(
            alignment: WrapAlignment.end,
            spacing: 8,
            runSpacing: 8,
            children: [
              if (onOpenFile != null)
                FilledButton.tonalIcon(
                  onPressed: onOpenFile,
                  icon: const Icon(Icons.open_in_new),
                  label: const Text('Open'),
                ),
              if (onShowInFileManager != null)
                FilledButton.tonalIcon(
                  onPressed: onShowInFileManager,
                  icon: const Icon(Icons.folder_open),
                  label: Text(_showInFileManagerLabel),
                ),
            ],
          ),
        );
      case PendingTransferStatus.failed:
        return Text(
          error == null ? 'Transfer failed' : 'Transfer failed: $error',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Theme.of(context).colorScheme.error),
        );
    }
  }

  String get _showInFileManagerLabel {
    if (Platform.isMacOS) return 'Show in Finder';
    if (Platform.isWindows) return 'Show in Explorer';
    return 'Show in folder';
  }
}

/// Renders a received non-file payload (text, link, or Wi-Fi credentials) with
/// copy / open actions, instead of auto-opening it.
class _ReceivedPayloadView extends StatelessWidget {
  final ReceivedPayload payload;

  const _ReceivedPayloadView({required this.payload});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isUrl = payload.kind == ReceivedPayloadKind.url;
    final isWifi = payload.kind == ReceivedPayloadKind.wifi;

    final String body;
    if (isWifi) {
      final security = payload.wifiSecurityType;
      body = [
        'Network: ${payload.wifiSsid ?? 'Unknown'}',
        if (payload.wifiPassword != null) 'Password: ${payload.wifiPassword}',
        if (security != null) 'Security: $security',
      ].join('\n');
    } else {
      body = payload.text ?? '';
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SelectableText(body, maxLines: 6, style: theme.textTheme.bodyMedium),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              if (payload.clipboardValue != null)
                FilledButton.tonalIcon(
                  onPressed: () => _copy(context, payload.clipboardValue!),
                  icon: const Icon(Icons.copy, size: 18),
                  label: Text(_copyLabel(isWifi)),
                ),
              if (isUrl && payload.text != null)
                FilledButton.tonalIcon(
                  onPressed: () => _open(context, payload.text!),
                  icon: const Icon(Icons.open_in_new, size: 18),
                  label: const Text('Open'),
                ),
            ],
          ),
        ],
      ),
    );
  }

  // The clipboard value for Wi-Fi is the password when present, otherwise the
  // SSID, so the button must be labelled accordingly.
  String _copyLabel(bool isWifi) {
    if (!isWifi) return 'Copy';
    return payload.wifiPassword != null ? 'Copy password' : 'Copy network name';
  }

  Future<void> _copy(BuildContext context, String value) async {
    await Clipboard.setData(ClipboardData(text: value));
    if (!context.mounted) return;
    ScaffoldMessenger.maybeOf(
      context,
    )?.showSnackBar(const SnackBar(content: Text('Copied to clipboard')));
  }

  Future<void> _open(BuildContext context, String url) async {
    final uri = Uri.tryParse(url);
    if (uri == null) return;
    final messenger = ScaffoldMessenger.maybeOf(context);
    var opened = false;
    try {
      opened = await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (_) {
      // launchUrl throws (rather than returning false) for unhandled schemes.
      opened = false;
    }
    if (!opened) {
      messenger?.showSnackBar(
        const SnackBar(content: Text('Could not open link')),
      );
    }
  }
}

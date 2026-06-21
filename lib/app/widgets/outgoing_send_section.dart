import 'package:crossdrop/nearby_share/api/models.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:qr_flutter/qr_flutter.dart';

class OutgoingSendButton extends StatelessWidget {
  final bool isPickingOutgoingFiles;
  final VoidCallback onPressed;

  const OutgoingSendButton({
    super.key,
    required this.isPickingOutgoingFiles,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: isPickingOutgoingFiles ? null : onPressed,
      icon: const Icon(Icons.upload_file),
      label: Text(isPickingOutgoingFiles ? 'Selecting...' : 'Send files...'),
      style: FilledButton.styleFrom(minimumSize: const Size(132, 48)),
    );
  }
}

class OutgoingSendPanel extends StatelessWidget {
  final List<String> outgoingFilePaths;

  /// When sending text/URL instead of files, a label describing the content.
  final String? outgoingTextLabel;
  final String? status;
  final String? pin;
  final double? progress;
  final Exception? error;
  final List<RemoteDeviceInfo> devices;
  final bool isDiscovering;
  final String? qrCodeUrl;
  final bool busy;
  final String? selectedDeviceId;
  final RemoteDeviceInfo? selectedDevice;
  final ValueChanged<RemoteDeviceInfo> onSendToDevice;
  final VoidCallback onCancel;

  const OutgoingSendPanel({
    super.key,
    required this.outgoingFilePaths,
    this.outgoingTextLabel,
    required this.status,
    required this.pin,
    required this.progress,
    required this.error,
    required this.devices,
    required this.isDiscovering,
    required this.qrCodeUrl,
    required this.busy,
    required this.selectedDeviceId,
    required this.selectedDevice,
    required this.onSendToDevice,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    final isText = outgoingTextLabel != null;
    final selectedFilesLabel = isText
        ? outgoingTextLabel!
        : outgoingFilePaths.length == 1
        ? p.basename(outgoingFilePaths.single)
        : '${outgoingFilePaths.length} files selected';
    final theme = Theme.of(context);
    final statusText = status ?? 'Choose a nearby device';
    final visibleDevices = <RemoteDeviceInfo>[...devices];
    final selected = selectedDevice;
    if (selected != null &&
        !visibleDevices.any((device) => device.id == selected.id)) {
      visibleDevices.insert(0, selected);
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(12, 6, 12, 12),
      decoration: BoxDecoration(
        border: Border.all(color: theme.dividerColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(isText ? Icons.notes : Icons.file_present, size: 18),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  selectedFilesLabel,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleSmall,
                ),
              ),
              IconButton(
                tooltip: 'Cancel send',
                onPressed: busy ? null : onCancel,
                visualDensity: VisualDensity.compact,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints.tightFor(
                  width: 34,
                  height: 34,
                ),
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(statusText),
          if (pin != null) ...[
            const SizedBox(height: 4),
            Text('PIN $pin', style: theme.textTheme.titleMedium),
          ],
          if (progress != null) ...[
            const SizedBox(height: 8),
            LinearProgressIndicator(value: progress),
          ],
          if (error != null) ...[
            const SizedBox(height: 8),
            Text(
              error.toString(),
              style: TextStyle(color: theme.colorScheme.error),
            ),
          ],
          const SizedBox(height: 12),
          if (visibleDevices.isEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 16,
                      height: 16,
                      child: isDiscovering
                          ? const CircularProgressIndicator(strokeWidth: 2)
                          : null,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      isDiscovering
                          ? 'Scanning for devices...'
                          : 'No nearby devices found',
                    ),
                  ],
                ),
                if (isDiscovering && qrCodeUrl != null && !busy) ...[
                  const SizedBox(height: 12),
                  Text('Scan QR code from Quick Share'),
                  const SizedBox(height: 8),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: QrImageView(
                        data: qrCodeUrl!,
                        version: QrVersions.auto,
                        size: 148,
                        backgroundColor: Colors.white,
                        eyeStyle: const QrEyeStyle(
                          eyeShape: QrEyeShape.square,
                          color: Colors.black,
                        ),
                        dataModuleStyle: const QrDataModuleStyle(
                          dataModuleShape: QrDataModuleShape.square,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            )
          else
            for (final device in visibleDevices)
              _OutgoingDeviceTile(
                device: device,
                selected: selectedDeviceId == device.id,
                enabled: !busy || selectedDeviceId == device.id,
                onTap: () => onSendToDevice(device),
              ),
        ],
      ),
    );
  }
}

class _OutgoingDeviceTile extends StatelessWidget {
  final RemoteDeviceInfo device;
  final bool selected;
  final bool enabled;
  final VoidCallback onTap;

  const _OutgoingDeviceTile({
    required this.device,
    required this.selected,
    required this.enabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final icon = switch (device.type) {
      DeviceType.phone => Icons.smartphone,
      DeviceType.tablet => Icons.tablet_mac,
      DeviceType.computer => Icons.computer,
      DeviceType.unknown => Icons.devices,
    };

    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon),
      title: Text(device.name, maxLines: 1, overflow: TextOverflow.ellipsis),
      subtitle: selected ? const Text('Selected') : null,
      trailing: selected
          ? const SizedBox(
              width: 18,
              height: 18,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : const Icon(Icons.chevron_right),
      enabled: enabled,
      onTap: enabled ? onTap : null,
    );
  }
}

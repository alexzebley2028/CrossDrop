import 'package:crossdrop/nearby_share/api/models.dart';

class PendingTransfer {
  final TransferMetadata metadata;
  final RemoteDeviceInfo device;

  const PendingTransfer({required this.metadata, required this.device});
}

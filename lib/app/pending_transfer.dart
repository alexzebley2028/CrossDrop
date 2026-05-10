import 'package:crossdrop/nearby_share/api/models.dart';

enum PendingTransferStatus { awaitingConsent, receiving, finished, failed }

class PendingTransfer {
  final TransferMetadata metadata;
  final RemoteDeviceInfo device;
  final PendingTransferStatus status;
  final double? progress;
  final String? error;

  const PendingTransfer({
    required this.metadata,
    required this.device,
    this.status = PendingTransferStatus.awaitingConsent,
    this.progress,
    this.error,
  });

  PendingTransfer copyWith({
    PendingTransferStatus? status,
    double? progress,
    String? error,
  }) {
    return PendingTransfer(
      metadata: metadata,
      device: device,
      status: status ?? this.status,
      progress: progress ?? this.progress,
      error: error,
    );
  }
}

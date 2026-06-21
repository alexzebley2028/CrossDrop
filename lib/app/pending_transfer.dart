import 'package:crossdrop/nearby_share/api/models.dart';

enum PendingTransferStatus { awaitingConsent, receiving, finished, failed }

class PendingTransfer {
  final TransferMetadata metadata;
  final RemoteDeviceInfo device;
  final PendingTransferStatus status;
  final double? progress;
  final String? error;

  /// A received non-file payload (text/URL/Wi-Fi), available once it arrives.
  final ReceivedPayload? receivedPayload;

  const PendingTransfer({
    required this.metadata,
    required this.device,
    this.status = PendingTransferStatus.awaitingConsent,
    this.progress,
    this.error,
    this.receivedPayload,
  });

  PendingTransfer copyWith({
    PendingTransferStatus? status,
    double? progress,
    String? error,
    ReceivedPayload? receivedPayload,
  }) {
    return PendingTransfer(
      metadata: metadata,
      device: device,
      status: status ?? this.status,
      progress: progress ?? this.progress,
      error: error,
      receivedPayload: receivedPayload ?? this.receivedPayload,
    );
  }
}

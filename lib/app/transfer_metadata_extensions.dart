import 'package:crossdrop/nearby_share/api/models.dart';

extension TransferMetadataCopy on TransferMetadata {
  TransferMetadata copyWith({
    List<ShareFileMetadata>? files,
    String? id,
    String? pinCode,
    String? textDescription,
  }) {
    return TransferMetadata(
      files: files ?? this.files,
      id: id ?? this.id,
      pinCode: pinCode ?? this.pinCode,
      textDescription: textDescription ?? this.textDescription,
    );
  }
}

import 'package:equatable/equatable.dart';

class ScanItem extends Equatable {
  final String id;
  final String value;       // QR/barcode content
  final DateTime scannedAt; // timestamp

  const ScanItem({
    required this.id,
    required this.value,
    required this.scannedAt,
  });

  @override
  List<Object?> get props => [id, value, scannedAt];
}
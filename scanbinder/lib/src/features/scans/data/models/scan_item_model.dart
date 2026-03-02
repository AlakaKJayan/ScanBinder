import 'package:hive/hive.dart';
import '../../domain/entities/scan_item.dart';

  part 'scan_item_model.g.dart';

@HiveType(typeId: 1)
class ScanItemModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String value;

  @HiveField(2)
  DateTime scannedAt;

  ScanItemModel({required this.id, required this.value, required this.scannedAt});

  factory ScanItemModel.fromEntity(ScanItem e) =>
      ScanItemModel(id: e.id, value: e.value, scannedAt: e.scannedAt);

  ScanItem toEntity() => ScanItem(id: id, value: value, scannedAt: scannedAt);
}
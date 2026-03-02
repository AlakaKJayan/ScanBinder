// lib/src/features/scans/data/sources/local/hive_scan_local_ds.dart
import 'package:hive/hive.dart';
import '../../models/scan_item_model.dart';

class HiveScanLocalDataSource {
  static const scansBoxName = 'scans';
  final Box<ScanItemModel> box;

  HiveScanLocalDataSource(this.box);

  Future<List<ScanItemModel>> getAll() async => box.values.toList();
  Future<void> add(ScanItemModel m) async => box.put(m.id, m);
  Future<void> delete(String id) async => box.delete(id);

  Future<List<ScanItemModel>> search(String query) async {
    final q = query.trim().toLowerCase();
    if (q.isEmpty) return getAll();
    return box.values
        .where((m) => m.value.toLowerCase().contains(q))
        .toList();
  }
}
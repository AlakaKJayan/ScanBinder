import 'package:scanbinder/src/features/scans/domain/repos/scan_repository.dart';

import '../../domain/entities/scan_item.dart';
import '../models/scan_item_model.dart';
import '../sources/local/hive_scan_local_ds.dart';

class ScanRepositoryImpl implements ScanRepository {
  final HiveScanLocalDataSource local;

  ScanRepositoryImpl({required this.local});

  @override
  Future<void> add(ScanItem item) async {
    final m = ScanItemModel(id: item.id, value: item.value, scannedAt: item.scannedAt);
    await local.add(m);
  }

  @override
  Future<void> delete(String id) => local.delete(id);

  @override
  Future<List<ScanItem>> getAll() async {
    final models = await local.getAll();
    return models.map((m) => ScanItem(id: m.id, value: m.value, scannedAt: m.scannedAt)).toList();
    }

  @override
  Future<List<ScanItem>> search(String query) async {
    final models = await local.search(query);
    return models.map((m) => ScanItem(id: m.id, value: m.value, scannedAt: m.scannedAt)).toList();
  }
}
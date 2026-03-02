import '../entities/scan_item.dart';

abstract class ScanRepository {
  Future<List<ScanItem>> getAll();
  Future<void> add(ScanItem item);
  Future<void> delete(String id);
  Future<List<ScanItem>> search(String query);
}
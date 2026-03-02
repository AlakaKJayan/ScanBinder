// lib/src/services/storage/hive_initializer.dart
import 'package:hive_flutter/hive_flutter.dart';
import '../../features/scans/data/models/scan_item_model.dart';
import '../../features/scans/data/sources/local/hive_scan_local_ds.dart';

/// Central place to initialize Hive, register adapters, and open boxes.
class HiveInitializer {
  static Future<HiveScanLocalDataSource> init() async {
    // Initializes Hive for Flutter (uses application documents dir internally)
    await Hive.initFlutter();

    // Register all adapters (one per @HiveType class)
    Hive.registerAdapter(ScanItemModelAdapter());

    // Open your boxes
    final box = await Hive.openBox<ScanItemModel>(
      HiveScanLocalDataSource.scansBoxName,
    );

    // Return your local data source wired to the opened box
    return HiveScanLocalDataSource(box);
  }
}
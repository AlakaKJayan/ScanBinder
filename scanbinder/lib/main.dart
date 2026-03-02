// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/app/app.dart';
import 'src/features/scans/data/repositories/scan_repository_impl.dart';
import 'src/features/scans/presentation/state/scans_cubit.dart';
import 'src/services/storage/hive_initializer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Init Hive and get a local data source
  final localDS = await HiveInitializer.init();

  // Wire repository
  final repo = ScanRepositoryImpl(local: localDS);

  runApp(
    BlocProvider(
      create: (_) => ScansCubit(repo)..load(),
      child: const ScanBinderApp(),
    ),
  );
}
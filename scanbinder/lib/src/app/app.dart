import 'package:flutter/material.dart';
import '../features/scans/presentation/pages/home_page.dart';

class ScanBinderApp extends StatelessWidget {
  const ScanBinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ScanBinder',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
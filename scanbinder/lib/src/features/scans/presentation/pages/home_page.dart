// lib/src/features/scans/presentation/pages/home_page.dart
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ScanBinder')),
      body: const Center(child: Text('No scans yet')),
    );
  }
}
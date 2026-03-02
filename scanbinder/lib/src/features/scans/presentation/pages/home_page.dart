// lib/src/features/scans/presentation/pages/home_page.dart

import 'package:flutter/material.dart';
import 'package:scanbinder/src/features/scans/presentation/pages/scan_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? scannedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ScanBinder')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              scannedValue ?? "No scan available",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ScanScreen()),
                );

                if (result != null) {
                  setState(() {
                    scannedValue = result;
                  });
                }
              },
              child: const Text("Start Scanning"),
            ),
          ],
        ),
      ),
    );
  }
}

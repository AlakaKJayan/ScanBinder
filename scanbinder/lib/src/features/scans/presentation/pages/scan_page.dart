import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  bool isScanned = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scan"),
      ),
      body: MobileScanner(
        onDetect: (capture) {
          if (isScanned) return;
          final List<Barcode> barcodes = capture.barcodes;

          if (barcodes.isNotEmpty) {
            final String value = barcodes.first.rawValue ?? "Unknown";

            setState(() => isScanned = true);

            Navigator.pop(context, value); // return scanned value
          }
        },
      ),
    );
  }
}
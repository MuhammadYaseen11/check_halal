// import 'package:flutter/material.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';

// class ScanScreen extends StatelessWidget {
//   final void Function(String barcode) onDetect;

//   const ScanScreen({super.key, required this.onDetect});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Scan Barcode')),
//       body: MobileScanner(
//         onDetect: (barcodeCapture) {
//           final barcode = barcodeCapture.barcodes.first.rawValue;
//           if (barcode != null) {
//             onDetect(barcode);
//             Navigator.pop(context); // close the scanner screen
//           }
//         },
//       ),
//     );
//   }
// }

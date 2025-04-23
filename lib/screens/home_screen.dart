import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../services/food_check_service.dart';
import 'result_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _hasScanned = false;

  void handleBarcode(String barcode) async {
    if (_hasScanned) return; // Prevent multiple scans
    setState(() => _hasScanned = true);

    try {
      final product = await FoodCheckService.fetchProduct(barcode);
      final ingredients = product?['ingredients_text'] ?? "Not available";
      final result = FoodCheckService.checkHalalStatus(ingredients);

      if (mounted) {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (_) => ResultScreen(
                  name: product?['product_name'] ?? 'Unknown Product',
                  ingredients: ingredients,
                  result: result,
                ),
          ),
        );
      }
    } catch (e) {
      // Handle any errors that occur during barcode processing
      debugPrint('Error processing barcode: $e');
    } finally {
      // Reset the scan state after processing
      if (mounted) {
        setState(() => _hasScanned = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Halal Checker")),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Text("Scan barcode to check halal status"),
          const SizedBox(height: 20),
          Expanded(
            child: MobileScanner(
              onDetect: (barcodeCapture) {
                final barcode = barcodeCapture.barcodes.first.rawValue;
                if (barcode != null) {
                  handleBarcode(barcode);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:check_halal/model/ingredient.dart';
// import 'package:flutter/material.dart';
// import '../services/halal_checker_service.dart';
// import '../services/mock_barcode_lookup.dart';
// import '../widgets/search_box.dart';
// import 'scan_screen.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final TextEditingController _controller = TextEditingController();
//   Ingredient? result;
//   String resultText = '';
//   Color resultColor = Colors.green;

//   void _search() {
//     final query = _controller.text.trim();
//     final ingredient = checkIngredient(query);
//     setState(() {
//       result = ingredient;
//       if (ingredient == null) {
//         resultText = 'Ingredient not found (Unknown)';
//         resultColor = Colors.grey;
//       } else if (ingredient.status == 'halal') {
//         resultText = '${ingredient.name} is HALAL';
//         resultColor = Colors.green;
//       } else if (ingredient.status == 'haram') {
//         resultText = '${ingredient.name} is HARAM';
//         resultColor = Colors.red;
//       } else {
//         resultText = '${ingredient.name} is DOUBTFUL';
//         resultColor = Colors.orange;
//       }
//     });
//   }

//   void _scanBarcode() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder:
//             (_) => ScanScreen(
//               onDetect: (barcode) {
//                 final ingredients = getIngredientsFromBarcode(barcode);
//                 if (ingredients == null) {
//                   setState(() {
//                     resultText = 'Product not found (Unknown)';
//                     resultColor = Colors.grey;
//                   });
//                 } else {
//                   final containsHaram = ingredients.any(
//                     (item) => checkIngredient(item)?.status == 'haram',
//                   );
//                   final containsDoubtful = ingredients.any(
//                     (item) => checkIngredient(item)?.status == 'doubtful',
//                   );

//                   setState(() {
//                     if (containsHaram) {
//                       resultText = 'Product is HARAM';
//                       resultColor = Colors.red;
//                     } else if (containsDoubtful) {
//                       resultText = 'Product is DOUBTFUL';
//                       resultColor = Colors.orange;
//                     } else {
//                       resultText = 'Product is HALAL';
//                       resultColor = Colors.green;
//                     }
//                   });
//                 }
//               },
//             ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Halal Checker')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             SearchBox(controller: _controller, onSearch: _search),
//             const SizedBox(height: 16),
//             ElevatedButton.icon(
//               onPressed: _scanBarcode,
//               icon: const Icon(Icons.qr_code_scanner),
//               label: const Text("Scan Product"),
//             ),
//             const SizedBox(height: 24),
//             if (resultText.isNotEmpty)
//               Text(
//                 resultText,
//                 style: TextStyle(
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold,
//                   color: resultColor,
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }

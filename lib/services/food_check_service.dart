import 'dart:convert';
import 'package:http/http.dart' as http;

class FoodCheckService {
  static const List<String> haramIngredients = [
    'alcohol',
    'gelatin',
    'e120',
    'e392',
    'lard',
    'Lard',
    'pork',
    'rum',
    'bacon',
    'Pork',
    'ham',
    'Pork roasts',
    'poitrine de proc',
    'Lard Fume',
    'Pork fillet',
    'porc',
    'Filet de porc',
    'shortening (animal)',
    'vanilla extract',
    'cochineal',
    'carmine',
    'enzymes (porcine)',
    'enzymes (animal)',
    'enzymes (animal-derived)',
    'enzymes (animal-based)',
    'enzymes (animal-sourced)',
    'enzymes (animal origin)',
    'enzymes (animal product)',
  ];

  static Future<Map<String, dynamic>?> fetchProduct(String barcode) async {
    final url = Uri.parse(
      "https://world.openfoodfacts.org/api/v0/product/$barcode.json",
    );
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['product'];
    } else {
      return null;
    }
  }

  static String checkHalalStatus(String? ingredientsText) {
    if (ingredientsText == null) return "Unknown";

    final lowerText = ingredientsText.toLowerCase();
    for (var haram in haramIngredients) {
      if (lowerText.contains(haram)) return "Haram";
    }
    return "Halal";
  }
}

// import 'package:check_halal/model/ingredient.dart';

// final List<Ingredient> knownIngredients = [
//   Ingredient(name: 'gelatin', status: 'haram'),
//   Ingredient(name: 'alcohol', status: 'haram'),
//   Ingredient(name: 'vanilla extract', status: 'haram'),
//   Ingredient(name: 'enzymes', status: 'doubtful'),
//   Ingredient(name: 'lard', status: 'haram'),
//   Ingredient(name: 'cochineal', status: 'doubtful'),
//   Ingredient(name: 'carmine', status: 'doubtful'),
//   Ingredient(name: 'sugar', status: 'halal'),
//   Ingredient(name: 'citric acid', status: 'halal'),
//   Ingredient(name: 'salt', status: 'halal'),
//   Ingredient(name: 'water', status: 'halal'),
//   Ingredient(name: 'herbs', status: 'halal'),
// ];

// Ingredient? checkIngredient(String query) {
//   final lowerQuery = query.toLowerCase();
//   return knownIngredients.firstWhere(
//     (ingredient) => lowerQuery.contains(ingredient.name.toLowerCase()),
//     orElse: () => Ingredient(name: 'unknown', status: 'unknown'),
//   );
// }

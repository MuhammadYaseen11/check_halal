// lib/utils/halal_checker.dart

const List<String> haramIngredients = [
  "gelatin",
  "alcohol",
  "enzymes (porcine)",
  "lard",
  "pork",
  "rum",
  "bacon",
  "ham",
  "shortening (animal)",
  "vanilla extract",
  "cochineal",
  "carmine",
];

String checkHalalStatus(List<String> ingredients) {
  for (String item in ingredients) {
    for (String haram in haramIngredients) {
      if (item.toLowerCase().contains(haram)) {
        return "Haram";
      }
    }
  }

  return ingredients.isEmpty ? "Unknown" : "Halal";
}

Map<String, List<String>> mockProductIngredients = {
  '1234567890': ['Gelatin', 'Sugar', 'Water'],
  '0987654321': ['E471', 'Flour', 'Salt'],
  '1111111111': ['Vitamin C', 'Milk', 'E100'],
};

List<String>? getIngredientsFromBarcode(String barcode) {
  return mockProductIngredients[barcode];
}

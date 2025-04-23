import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String name;
  final String ingredients;
  final String result;

  const ResultScreen({
    super.key,
    required this.name,
    required this.ingredients,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    Color color =
        result == "Halal"
            ? Colors.green
            : result == "Haram"
            ? Colors.red
            : Colors.grey;

    return Scaffold(
      appBar: AppBar(title: const Text("Result")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(name, style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            Text("Ingredients:\n$ingredients"),
            const SizedBox(height: 20),
            Text(
              "Result: $result",
              style: TextStyle(fontSize: 22, color: color),
            ),
          ],
        ),
      ),
    );
  }
}

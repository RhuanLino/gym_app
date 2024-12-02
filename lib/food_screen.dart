import 'package:flutter/material.dart';

class FoodScreen extends StatelessWidget {
  final List<Map<String, String>> foods = [
    {'name': 'Banana', 'calories': '74 kcal'},
    {'name': 'Maçã', 'calories': '45 kcal'},
    {'name': 'Melancia', 'calories': '89 kcal'},
    {'name': 'Açaí', 'calories': '116 kcal'},
    {'name': 'Ovo Cozido', 'calories': '68 kcal'},
    {'name': 'Pão Integral', 'calories': '69 kcal por fatia'},
    {'name': 'Arroz Integral', 'calories': '110 kcal por porção'},
    {'name': 'Feijão Preto', 'calories': '77 kcal por porção'},
    {'name': 'Frango Grelhado', 'calories': '165 kcal por 100g'},
    {'name': 'Batata Doce', 'calories': '86 kcal por 100g'},
    {'name': 'Peixe (Tilápia)', 'calories': '129 kcal por 100g'},
    {'name': 'Iogurte Natural', 'calories': '59 kcal por 100g'},
    {'name': 'Granola', 'calories': '471 kcal por 100g'},
    {'name': 'Abacaxi', 'calories': '50 kcal por 100g'},
    {'name': 'Amêndoas', 'calories': '576 kcal por 100g'},
  ];

  FoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alimentos'),
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: foods.length,
          itemBuilder: (context, index) {
            final food = foods[index];
            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                leading: const Icon(Icons.fastfood, color: Colors.redAccent),
                title: Text(
                  food['name']!,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Calorias: ${food['calories']}'),
              ),
            );
          },
        ),
      ),
    );
  }
}

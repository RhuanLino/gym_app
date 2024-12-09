import 'package:flutter/material.dart';

class DietDetailScreen extends StatelessWidget {
  final String title;
  final List<dynamic> alimentos; // Recebendo a lista de alimentos da API

  const DietDetailScreen({
    super.key,
    required this.title,
    required this.alimentos,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Cabeçalho
            Text(
              'Detalhes da Refeição',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
              ),
            ),
            const SizedBox(height: 20),

            // Itens da refeição
            const Text(
              'Itens da Refeição',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
              ),
            ),
            const SizedBox(height: 10),
            ...alimentos.map<Widget>((alimento) => Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 3,
                  child: ListTile(
                    title: Text(
                      alimento['alimento'] ?? 'Alimento não especificado',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text(
                      'Quantidade: ${alimento['quantidade'] ?? 0}g',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

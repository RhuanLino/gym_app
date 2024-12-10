import 'package:flutter/material.dart';

class DietDetailScreen extends StatelessWidget {
  final String title;
  final List<dynamic> details; // Recebendo a lista de alimentos da API

  const DietDetailScreen({
    super.key,
    required this.title,
    required this.details,
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
            ...details.map<Widget>((item) {
              return ListTile(
                leading: const Icon(Icons.check_circle, color: Colors.redAccent),
                title: Text(
                  item['alimento'] ?? 'Sem informação', // Exibe o nome do alimento
                  style: const TextStyle(fontSize: 16),
                ),
                subtitle: Text(
                  'Quantidade: ${item['quantidade'] ?? '0'}g', // Exibe a quantidade
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
                ),
              );
            }).toList(),
            const SizedBox(height: 20),

            // Informações Nutricionais (Exemplo para outro tipo de dado)
            const Text(
              'Informações Nutricionais',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
              ),
            ),
            const SizedBox(height: 10),
            // Caso precise exibir outras informações, adicione a lógica aqui
            ...details.map<Widget>((item) {
              return ListTile(
                leading: const Icon(Icons.info_outline, color: Colors.redAccent),
                title: Text(
                  'Informações não especificadas para este item.',
                  style: const TextStyle(fontSize: 16),
                ),
              );
            }).toList(),
            const SizedBox(height: 20),

            // Sugestões de Substituição (se houver)
            const Text(
              'Sugestões de Substituição',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Sem substituições disponíveis.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

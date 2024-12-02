import 'package:flutter/material.dart';

class DietDetailScreen extends StatelessWidget {
  final String title;
  final Map<String, dynamic> details;

  const DietDetailScreen({super.key, required this.title, required this.details});

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
            // Descrição
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.redAccent.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                details['Descrição'],
                style: const TextStyle(fontSize: 16, color: Colors.redAccent),
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
            ...details['Itens'].map<Widget>((item) => ListTile(
                  leading: const Icon(Icons.check_circle, color: Colors.redAccent),
                  title: Text(
                    item,
                    style: const TextStyle(fontSize: 16),
                  ),
                )),
            const SizedBox(height: 20),

            // Informações Nutricionais
            const Text(
              'Informações Nutricionais',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
              ),
            ),
            ...details['Informações Nutricionais']
                .map<Widget>((info) => ListTile(
                      leading:
                          const Icon(Icons.info_outline, color: Colors.redAccent),
                      title: Text(
                        info,
                        style: const TextStyle(fontSize: 16),
                      ),
                    )),
            const SizedBox(height: 20),

            // Substituições
            const Text(
              'Sugestões de Substituição',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
              ),
            ),
            ...details['Substituições'].map<Widget>((sub) => ListTile(
                  leading: const Icon(Icons.swap_horiz, color: Colors.redAccent),
                  title: Text(
                    sub,
                    style: const TextStyle(fontSize: 16),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

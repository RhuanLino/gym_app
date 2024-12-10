import 'package:flutter/material.dart';
import 'package:gym_app/services/requests.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({super.key});

  @override
  _FoodScreenState createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  late Future<List<Map<String, dynamic>>> _alimentos;

  @override
  void initState() {
    super.initState();
    _alimentos = getAlimentos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alimentos'),
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<List<Map<String, dynamic>>>(
          future: _alimentos,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Exibe um indicador de carregamento enquanto os dados são buscados
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              // Exibe uma mensagem de erro caso ocorra algum problema
              return Center(
                child: Text(
                  'Erro ao carregar alimentos: ${snapshot.error}',
                  style: const TextStyle(color: Colors.red),
                ),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              // Exibe uma mensagem caso não haja dados
              return const Center(
                child: Text('Nenhum alimento encontrado.'),
              );
            }

            // Exibe os dados quando disponíveis
            final alimentos = snapshot.data!;
            return ListView.builder(
              itemCount: alimentos.length,
              itemBuilder: (context, index) {
                final food = alimentos[index];
                return Card(
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    leading: const Icon(Icons.fastfood, color: Colors.redAccent),
                    title: Text(
                      food['nome'] ?? 'Desconhecido',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('${food['kcal'] ?? 'N/A'} Kcal'),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

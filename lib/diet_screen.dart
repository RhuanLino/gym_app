import 'package:flutter/material.dart';
import 'package:gym_app/services/requests.dart';
import 'diet_detail_screen.dart';

class DietScreen extends StatefulWidget {
  const DietScreen({super.key});

  @override
  _DietScreenState createState() => _DietScreenState();
}

class _DietScreenState extends State<DietScreen> {
  late Future<List<Map<String, dynamic>>> _dietas;

  IconData _getIconRefeicao(String? refeicao) {
    switch (refeicao?.toLowerCase()) {
      case 'café da manhã':
        return Icons.breakfast_dining;
      case 'lanche da manhã':
        return Icons.coffee;
      case 'almoço':
        return Icons.lunch_dining;
      case 'lanche da tarde':
        return Icons.cookie;
      case 'jantar':
        return Icons.dinner_dining;
      case 'ceia':
        return Icons.bedtime;
      default:
        return Icons.fastfood;
    }
  }

  @override
  void initState() {
    super.initState();
    _dietas = getDieta();
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dietas'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<List<Map<String, dynamic>>>(
          future: _dietas,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  'Erro ao carregar as dietas.',
                  style: TextStyle(color: Colors.redAccent, fontSize: 18),
                ),
              );
            } else if (snapshot.hasData && snapshot.data!.isEmpty) {
              return const Center(
                child: Text(
                  'Nenhuma dieta encontrada.',
                  style: TextStyle(fontSize: 18),
                ),
              );
            } else if (snapshot.hasData) {
              final dietas = snapshot.data!;
              return ListView.builder(
                itemCount: dietas.length,
                itemBuilder: (context, index) {
                  final dieta = dietas[index];
                  return _buildDietCard(
                    context,
                    dieta['refeicao'] ?? 'Dieta',
                    dieta['horario'] ?? '',
                    _getIconRefeicao(dieta['refeicao']),
                    DietDetailScreen(
                      title: dieta['refeicao'] ?? 'Dieta',
                      details: dieta['alimentos'] ?? [],
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: Text('Algo deu errado.'),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildDietCard(BuildContext context, String title, String time,
      IconData icon, Widget screen) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          child: Icon(icon, size: 30, color: Colors.redAccent),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: Text(
          time,
          style: TextStyle(color: Colors.grey[600], fontSize: 14),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.redAccent),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        },
      ),
    );
  }
}

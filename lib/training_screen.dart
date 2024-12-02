import 'package:flutter/material.dart';
import 'training_detail_screen.dart';

class TrainingScreen extends StatelessWidget {
  final Map<String, List<Map<String, dynamic>>> trainingDetails = {
    'Treino 1': [
      {
        'name': 'Puxada Aberta',
        'sets': 4,
        'reps': '10-12',
        'rest': '60 segundos'
      },
      {'name': 'Puldown', 'sets': 3, 'reps': '10-12', 'rest': '60 segundos'},
      {
        'name': 'Remada Curvada',
        'sets': 3,
        'reps': '10-12',
        'rest': '60 segundos'
      },
      {
        'name': 'Remada Máquina',
        'sets': 3,
        'reps': '10-12',
        'rest': '60 segundos'
      },
      {
        'name': 'Crucifixo Invertido',
        'sets': 3,
        'reps': '10-12',
        'rest': '60 segundos'
      },
    ],
    'Treino 2': [
      {
        'name': 'Supino Inclinado',
        'sets': 3,
        'reps': '12-15',
        'rest': '45 segundos'
      },
      {
        'name': 'Supino Reto',
        'sets': 3,
        'reps': '12-15',
        'rest': '45 segundos'
      },
      {
        'name': 'Crucifixo Maquina',
        'sets': 3,
        'reps': '12-15',
        'rest': '45 segundos'
      },
      {
        'name': 'Elevação Lateral',
        'sets': 3,
        'reps': '12-15',
        'rest': '45 segundos'
      },
      {
        'name': 'Desenvolvimento com Halteres',
        'sets': 3,
        'reps': '8-10',
        'rest': '90 segundos'
      },
      {
        'name': 'Encolhimento com Halteres',
        'sets': 3,
        'reps': '12',
        'rest': '45 segundos'
      },
    ],
    'Treino 3': [
      {
        'name': 'Rosca Direta',
        'sets': 3,
        'reps': '12-15',
        'rest': '45 segundos'
      },
      {
        'name': 'Rosca Concentrada',
        'sets': 3,
        'reps': '10-12',
        'rest': '60 segundos'
      },
      {
        'name': 'Rosca Martelo',
        'sets': 3,
        'reps': '12-15',
        'rest': '45 segundos'
      },
      {
        'name': 'Triceps Corda',
        'sets': 3,
        'reps': '12-15',
        'rest': '45 segundos'
      },
      {
        'name': 'Triceps Francês',
        'sets': 3,
        'reps': '12-15',
        'rest': '45 segundos'
      },
    ],
    'Treino 4': [
      {
        'name': 'Agachamento Livre',
        'sets': 4,
        'reps': '8-10',
        'rest': '90 segundos'
      },
      {
        'name': 'Leg Press 45º',
        'sets': 3,
        'reps': '10-12',
        'rest': '60 segundos'
      },
      {
        'name': 'Extensão de Quadríceps',
        'sets': 4,
        'reps': '12-15',
        'rest': '60 segundos'
      },
      {'name': 'Stiff', 'sets': 4, 'reps': '12-15', 'rest': '60 segundos'},
      {
        'name': 'Cadeira Flexora',
        'sets': 4,
        'reps': '12-15',
        'rest': '60 segundos'
      },
    ],
    'Treino 5': [
      {
        'name': 'Corrida na Esteira',
        'sets': 1,
        'reps': '30 minutos',
        'rest': 'N/A'
      },
      {
        'name': 'Prancha Abdominal',
        'sets': 3,
        'reps': '30 segundos',
        'rest': '30 segundos'
      },
      {
        'name': 'Abdominal Oblíquo',
        'sets': 3,
        'reps': '12-15',
        'rest': '45 segundos'
      },
    ],
  };

  TrainingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Treinos'),
        backgroundColor: Colors.redAccent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildTrainingCard(context, 'Treino 1', 'Costas', '10/09/2024'),
          _buildTrainingCard(
              context, 'Treino 2', 'Peitoral e Ombro', '11/09/2024'),
          _buildTrainingCard(
              context, 'Treino 3', 'Biceps e Triceps', '12/09/2024'),
          _buildTrainingCard(
              context, 'Treino 4', 'Perna completa', '13/09/2024'),
          _buildTrainingCard(
              context, 'Treino 5', 'Cardio e Abdômen', '14/09/2024'),
        ],
      ),
    );
  }

  Widget _buildTrainingCard(
      BuildContext context, String title, String description, String lastDate) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(description),
            const SizedBox(height: 10),
            Text(
              'Último Treino: $lastDate',
              style: TextStyle(color: Colors.grey[700]),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TrainingDetailScreen(
                          title: title,
                          exercises: trainingDetails[title] ?? [],
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                  ),
                  child: Text('Ver Treino'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

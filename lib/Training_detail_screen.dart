import 'package:flutter/material.dart';

class TrainingDetailScreen extends StatelessWidget {
  final String title;
  final List<Map<String, dynamic>> exercises;

  const TrainingDetailScreen({super.key, required this.title, required this.exercises});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Lista de Exercícios',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: exercises.length,
                itemBuilder: (context, index) {
                  final exercise = exercises[index];
                  return _buildExerciseCard(
                    exercise['name'],
                    exercise['sets'],
                    exercise['reps'],
                    exercise['rest'],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExerciseCard(String name, int sets, String reps, String rest) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Séries: $sets'),
            Text('Repetições: $reps'),
            Text('Intervalo: $rest'),
          ],
        ),
      ),
    );
  }
}

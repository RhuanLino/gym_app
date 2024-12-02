import 'package:flutter/material.dart';
import 'diet_detail_screen.dart';

class DietScreen extends StatelessWidget {
  const DietScreen({super.key});

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Escolha sua refeição:',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildDietCard(
                    context,
                    'Café da Manhã',
                    '08:00 - 09:30',
                    Icons.breakfast_dining,
                    const DietDetailScreen(
                      title: 'Café da Manhã',
                      details: {
                        'Descrição':
                            'Refeição para fornecer energia ao longo do dia.',
                        'Itens': [
                          '2 fatias de pão integral',
                          '1 ovo cozido',
                          '1 banana',
                          '1 xícara de café sem açúcar'
                        ],
                        'Informações Nutricionais': [
                          'Calorias: 250 kcal',
                          'Proteínas: 10g',
                          'Carboidratos: 30g',
                          'Gorduras: 5g'
                        ],
                        'Substituições': [
                          'Pão integral por tapioca',
                          'Banana por maçã',
                          'Café sem açúcar por chá verde'
                        ],
                      },
                    ),
                  ),
                  _buildDietCard(
                    context,
                    'Lanche da Manhã',
                    '10:00 - 11:00',
                    Icons.coffee,
                    const DietDetailScreen(
                      title: 'Lanche da Manhã',
                      details: {
                        'Descrição': 'Refeição leve para manter a saciedade.',
                        'Itens': ['1 maçã', '10 amêndoas', '1 iogurte natural'],
                        'Informações Nutricionais': [
                          'Calorias: 200 kcal',
                          'Proteínas: 8g',
                          'Carboidratos: 20g',
                          'Gorduras: 10g'
                        ],
                        'Substituições': [
                          'Maçã por pera',
                          'Amêndoas por castanha de caju',
                          'Iogurte natural por leite desnatado'
                        ],
                      },
                    ),
                  ),
                  _buildDietCard(
                    context,
                    'Almoço',
                    '12:00 - 13:30',
                    Icons.lunch_dining,
                    const DietDetailScreen(
                      title: 'Almoço',
                      details: {
                        'Descrição': 'Refeição principal do dia.',
                        'Itens': [
                          '100g de peito de frango grelhado',
                          '100g de arroz integral',
                          '50g de feijão preto',
                          'Salada verde (alface, tomate, cenoura)'
                        ],
                        'Informações Nutricionais': [
                          'Calorias: 400 kcal',
                          'Proteínas: 30g',
                          'Carboidratos: 50g',
                          'Gorduras: 8g'
                        ],
                        'Substituições': [
                          'Frango grelhado por carne magra',
                          'Arroz integral por quinoa',
                          'Feijão por lentilha'
                        ],
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
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

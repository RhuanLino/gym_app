import 'package:flutter/material.dart';
import 'training_screen.dart';
import 'food_screen.dart';
import 'diet_screen.dart';
import 'user_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('STARTGYM'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Boas-vindas
              const Text(
                'Bem-vindo(a), Usuário!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // Banner principal com botão
              Container(
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: const DecorationImage(
                    image: AssetImage('assets/gym.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TrainingScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      padding:
                          const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                    child: Text('Ver Treinos'),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Seção Alimentação
              const Text(
                'Alimentação',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildOptionCard(
                    context,
                    'Café da Manhã',
                    Icons.breakfast_dining,
                    FoodScreen(),
                  ),
                  _buildOptionCard(
                    context,
                    'Almoço',
                    Icons.lunch_dining,
                    FoodScreen(),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Seção Dietas
              const Text(
                'Dietas',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildOptionCard(
                    context,
                    'Planos de Dieta',
                    Icons.restaurant_menu,
                    DietScreen(),
                  ),
                  _buildOptionCard(
                    context,
                    'Recomendações',
                    Icons.local_dining,
                    DietScreen(),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Seção Usuário
              const Text(
                'Perfil',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildOptionCard(
                    context,
                    'Meu Perfil',
                    Icons.person,
                    UserScreen(),
                  ),
                  _buildOptionCard(
                    context,
                    'Histórico',
                    Icons.history,
                    UserScreen(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.grey,
        currentIndex: 0, // Define o índice inicial
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DietScreen()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TrainingScreen()),
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FoodScreen()),
            );
          } else if (index == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UserScreen()),
            );
          }
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Menu'),
          BottomNavigationBarItem(
              icon: Icon(Icons.restaurant_menu), label: 'Dietas'),
          BottomNavigationBarItem(
              icon: Icon(Icons.fitness_center), label: 'Treinos'),
          BottomNavigationBarItem(
              icon: Icon(Icons.fastfood), label: 'Alimentos'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Usuário'),
        ],
      ),
    );
  }

  Widget _buildOptionCard(
      BuildContext context, String title, IconData icon, Widget screen) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => screen));
      },
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.redAccent),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}

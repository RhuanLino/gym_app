import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  void _logout(BuildContext context) {
    // Função de sair
    Navigator.pop(context); // Ajuste para sair ou voltar para tela de login
  }

  void _navigateToPersonalData(BuildContext context) {
    // Navegar para Dados Pessoais
  }

  void _navigateToDocumentation(BuildContext context) {
    // Navegar para Documentação
  }

  void _navigateToFAQ(BuildContext context) {
    // Navegar para Perguntas Frequentes
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título principal
            const SizedBox(height: 20),
            const Text(
              'Objetivo',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
              ),
            ),
            const SizedBox(height: 10),
            const Text('Ganhar massa muscular', style: TextStyle(fontSize: 16)),

            // Histórico de treino
            const SizedBox(height: 20),
            const Text(
              'Histórico de treino',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
              ),
            ),
            const SizedBox(height: 10),
            const Text('Treinei 5x ou mais na semana',
                style: TextStyle(fontSize: 16)),

            // Dieta
            const SizedBox(height: 20),
            const Text(
              'Dieta',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
              ),
            ),
            const SizedBox(height: 10),
            const Text('Ganhar massa e definição muscular',
                style: TextStyle(fontSize: 16)),

            // Opções
            const SizedBox(height: 30),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.redAccent),
              title: const Text('Dados Pessoais'),
              trailing: const Icon(Icons.keyboard_arrow_right),
              onTap: () => _navigateToPersonalData(context),
            ),
            ListTile(
              leading: const Icon(Icons.description, color: Colors.redAccent),
              title: const Text('Documentação'),
              trailing: const Icon(Icons.keyboard_arrow_right),
              onTap: () => _navigateToDocumentation(context),
            ),
            ListTile(
              leading: const Icon(Icons.help_outline, color: Colors.redAccent),
              title: const Text('Perguntas Frequentes'),
              trailing: const Icon(Icons.keyboard_arrow_right),
              onTap: () => _navigateToFAQ(context),
            ),

            // Botão de sair
            const Spacer(),
            Center(
              child: TextButton(
                onPressed: () => _logout(context),
                child: const Text(
                  'Sair do Aplicativo',
                  style: TextStyle(color: Colors.redAccent, fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

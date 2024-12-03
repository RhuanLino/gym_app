// requests.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> login(String email, String password) async {
  final url = Uri.parse('localhost:5000/'); 
  final headers = {'Content-Type': 'application/json'};

  final body = json.encode({
    'email': email,
    'password': password,
  });

  try {
    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      // Sucesso: resposta da API
      return json.decode(response.body);
    } else {
      // Caso a resposta não seja bem-sucedida
      return {'error': 'Email ou senha incorretos'};
    }
  } catch (e) {
    // Erro na requisição
    return {'error': 'Falha ao conectar com a API'};
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const storage = FlutterSecureStorage();
final apiUrl = Uri.parse('http://localhost:5000/');

Future<Map<String, dynamic>> login(String email, String password) async {
  final loginUrl = Uri.parse('${apiUrl}auth/login');
  final headers = {'Content-Type': 'application/json'};

  final body = json.encode({
    'email': email,
    'senha': password,
  });

  try {
    final response = await http.post(loginUrl, headers: headers, body: body);

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      if (responseData['token'] != null) {
        // Salvar o token no armazenamento seguro
        await storage.write(key: 'token', value: responseData['token']);
      }
      return responseData;
    } else {
      return {'error': 'Email ou senha incorretos'};
    }
  } catch (e) {
    return {'error': 'Falha ao conectar com a API'};
  }
}

Future<http.Response> makeAuthenticatedRequest(
    String endpoint, Map<String, dynamic> body) async {
  final token = await storage.read(key: 'token'); // Recuperar o token
  final headers = {
    'Content-Type': 'application/json',
    if (token != null) 'Authorization': 'Bearer $token',
  };

  final apiUrl = Uri.parse('http://localhost:5000/$endpoint');
  return await http.post(apiUrl, headers: headers, body: json.encode(body));
}

Future<void> logout() async {
  // Remover o token do armazenamento seguro no logout
  await storage.delete(key: 'token');
}

Future <Map<String, dynamic>> cadastro(String nome, String tipo, String email, String senha) async {
  final registerUrl = Uri.parse('${apiUrl}user/register');
  final headers = {'Content-Type': 'application/json'};

  final body = json.encode({
    'nome': nome,
    'tipo': tipo,
    'email': email,
    'senha': senha
  });

  try {
    final response = await http.post(registerUrl, headers: headers, body: body);

    if (response.statusCode == 201) {
      final responseData = json.decode(response.body);
      return responseData;
    } else if (response.statusCode == 400) {
      final errorResponse = json.decode(response.body);
      return {'error': errorResponse['message'] ?? 'Erro no cadastro'};
    } else {
      return {'error': 'Erro ao realizar o cadastro'};
    }
  } catch (e) {
    return {'error': 'Falha ao conectar com a API'};
  }
}

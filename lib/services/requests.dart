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

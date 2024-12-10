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
      
      final token = responseData['access_token'];
      if (token != null) {
        await storage.write(key: 'token', value: token);
      }
      return responseData;
    } else {
      return {'error': 'Email ou senha incorretos'};
    }
  } catch (e) {
    return {'error': 'Falha ao conectar com a API'};
  }
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

Future<List<Map<String, dynamic>>> getDieta() async {
  final getDietaUrl = Uri.parse('${apiUrl}user/buscardieta');

  try {
    final token = await storage.read(key: 'token');
    final headers = {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };

    final response = await http.get(getDietaUrl, headers: headers);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return List<Map<String, dynamic>>.from(data);
    } else {
      // Lidar com erro de status não OK
      print('Erro ao buscar dietas: ${response.statusCode}');
      return [];
    }
  } catch (e) {
    // Lidar com erros de exceção
    print('Erro ao buscar dietas: $e');
    return [];
  }
}

Future<List<Map<String, dynamic>>> getAlimentos() async {
  final getAlimentosUrl = Uri.parse('${apiUrl}alimentos/buscaralimentos');
  final headers = {'Content-Type': 'application/json'};

  try {
    final response = await http.get(getAlimentosUrl, headers: headers);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return List<Map<String, dynamic>>.from(data);
    } else {
      // Lidar com erro de status não OK
      print('Erro ao buscar alimentos: ${response.statusCode}');
      return [];
    }
  } catch (e) {
    // Lidar com erros de exceção
    print('Erro ao buscar alimentos: $e');
    return [];
  }
}


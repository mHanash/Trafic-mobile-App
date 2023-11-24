import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClient {
  static const String baseUrl = 'http://127.0.0.1:8000/api';
  static const String baseUrlLogin = 'http://127.0.0.1:8000';

  // Méthode pour effectuer une requête GET
  static Future<dynamic> get(String endpoint,
      {Map<String, String>? headers, Map<String, String>? params}) async {
    final url = Uri.parse('$baseUrl$endpoint');

    final response = await http.get(url, headers: headers);

    return _handleResponse(response);
  }

  // Méthode pour effectuer une requête POST
  static Future<dynamic> post(String endpoint,
      {Map<String, String>? headers, dynamic body}) async {
    final url = Uri.parse('$baseUrl$endpoint');

    final response =
        await http.post(url, headers: headers, body: json.encode(body));

    return _handleResponse(response);
  }

  // Méthode pour effectuer une requête PUT
  static Future<dynamic> put(String endpoint,
      {Map<String, String>? headers, dynamic body}) async {
    final url = Uri.parse('$baseUrl$endpoint');

    final response =
        await http.put(url, headers: headers, body: json.encode(body));

    return _handleResponse(response);
  }

  // Méthode pour effectuer une requête DELETE
  static Future<dynamic> delete(String endpoint,
      {Map<String, String>? headers}) async {
    final url = Uri.parse('$baseUrl$endpoint');

    final response = await http.delete(url, headers: headers);

    return _handleResponse(response);
  }

  // Méthode pour gérer la réponse HTTP
  static dynamic _handleResponse(http.Response response) {
    final statusCode = response.statusCode;
    final responseBody = json.decode(response.body);

    if (statusCode >= 200 && statusCode < 300) {
      // Succès de la requête
      return responseBody;
    } else {
      // Erreur de la requête
      throw ApiException(statusCode, responseBody['message']);
    }
  }

  // Méthode pour effectuer une requête LOGIN
  static Future<dynamic> login(String endpoint,
      {Map<String, String>? headers, dynamic body}) async {
    final url = Uri.parse('$baseUrlLogin$endpoint');
    final response =
        await http.post(url, headers: headers, body: json.encode(body));

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);

      // Récupérez le token JWT de la réponse
      final token = responseData['token'];
      return token;
    } else {
      throw Exception('Failed to login: ${response.statusCode}');
    }
  }
}

// Classe d'exception pour gérer les erreurs d'API
class ApiException implements Exception {
  final int statusCode;
  final String message;

  ApiException(this.statusCode, this.message);
}

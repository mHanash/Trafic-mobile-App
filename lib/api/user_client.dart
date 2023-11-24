import 'package:trafic_app/models/user_model.dart';

import 'api_client.dart';

class UserClient {
  static Future<UserModel> fetchUser(int userId) async {
    try {
      final response = await ApiClient.get('/users/$userId');
      final userData = response['data'];

      return UserModel(
        id: userData['id'],
        username: userData['username'],
        email: userData['email'],
        work: userData['work'],
        vehicleNumber: userData['vehicleNumber'],
        isVehicle: userData['isVehicle'],
      );
    } catch (e) {
      // Gérer les erreurs d'appel API
      throw Exception('Failed to fetch user: $e');
    }
  }

  static Future<dynamic> register(
    String username,
    String email,
    String password,
    String other,
    bool isVehicle,
  ) async {
    String otherLabel = '';
    if (isVehicle) {
      otherLabel = 'vehicule_number';
    } else {
      otherLabel = 'work';
    }
    try {
      final body = {
        'email': email,
        'password': password,
        'username': username,
        otherLabel: other,
        'isVehicle': isVehicle,
      };

      dynamic response = await ApiClient.post('/users',
          body: body, headers: {"Content-Type": "application/json"});
      return response;
    } catch (e) {
      // Gérer les erreurs d'appel API
      return null;
    }
  }

  static Future<void> updateUser(UserModel user) async {
    try {
      final body = {
        'username': user.username,
        'email': user.email,
        'isVehicle': user.isVehicle,
        'work': user.work,
        'vehicleNumber': user.vehicleNumber,
      };

      await ApiClient.put('/users/${user.id}', body: body);
    } catch (e) {
      // Gérer les erreurs d'appel API
      throw Exception('Failed to update user: $e');
    }
  }

  static Future<dynamic> login(String email, String password) async {
    try {
      final body = {
        'email': email,
        'password': password,
      };

      return await ApiClient.login('/login',
          body: body, headers: {"Content-Type": "application/json"});
    } catch (e) {
      // Gérer les erreurs d'appel API
      throw Exception('Failed to update user: $e');
    }
  }
}

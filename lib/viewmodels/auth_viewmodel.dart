import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:trafic_app/api/user_client.dart';
import 'package:trafic_app/models/user_model.dart';

class AuthViewModel with ChangeNotifier {
  String? _accessToken;
  bool _isLoading = false;
  final bool _isLoggedIn = false;
  String _errorMessage = '';
  UserModel? _userAuth = null;

  String? get accessToken => _accessToken;
  bool get isLoading => _isLoading;
  bool get isLoggedIn => _isLoggedIn;
  String get errorMessage => _errorMessage;
  UserModel? get userAuth => _userAuth;

  Future<void> login(String email, String password) async {
    try {
      _isLoading = true;

      // Effectuer l'appel API pour connecter l'utilisateur
      final token = await UserClient.login(email, password);
      // Récupérer le token d'accès de la réponse de l'API
      _accessToken = token;

      _isLoading = false;
      const storage = FlutterSecureStorage();
      await storage.write(key: 'jwt_token', value: _accessToken);
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      print(e);
      _errorMessage = 'Failed to login: $e';

      notifyListeners();
    }
  }

  Future<void> logout() async {
    _isLoading = true;
    const storage = FlutterSecureStorage();
    await storage.delete(key: 'jwt_token');
    _isLoading = false;
    notifyListeners();
    // Effectuer toutes les autres opérations nécessaires pour la déconnexion
  }

  Future<bool> getToken() async {
    const storage = FlutterSecureStorage();
    final token = await storage.read(key: 'jwt_token');
    _accessToken = token;
    return _accessToken != null;
  }

  Future<void> setToken(String token) async {
    const storage = FlutterSecureStorage();
    await storage.write(key: 'jwt_token', value: token);
    _accessToken = token;
  }
}

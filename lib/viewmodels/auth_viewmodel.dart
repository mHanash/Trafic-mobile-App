import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:trafic_app/api/user_client.dart';
import 'package:trafic_app/models/user_model.dart';

class AuthViewModel with ChangeNotifier {
  String? _accessToken;
  bool _isLoading = false;
  final bool _isLoggedIn = false;
  bool _subscribe = false;
  String _errorMessage = '';
  String _successMessage = '';
  UserModel? _userAuth = null;

  String? get accessToken => _accessToken;
  bool get isLoading => _isLoading;
  bool get isLoggedIn => _isLoggedIn;
  bool get subscribe => _subscribe;
  String get errorMessage => _errorMessage;
  String get successMessage => _successMessage;
  UserModel? get userAuth => _userAuth;

  Future<void> login(String email, String password) async {
    _successMessage = '';
    _errorMessage = '';
    try {
      _isLoading = true;

      // Effectuer l'appel API pour connecter l'utilisateur
      final response = await UserClient.login(email, password);

      _accessToken = response['token'];

      _isLoading = false;
      _userAuth = UserModel.fromJson(response['user']);
      setToken(response['token']);

      // notifyListeners();
    } catch (e) {
      _isLoading = false;
      _errorMessage = 'Error : $e';
      print(_errorMessage);

      notifyListeners();
    }
  }

  Future<void> register(
    String username,
    String email,
    String password,
    String other,
    bool isVehicle,
  ) async {
    try {
      _successMessage = '';
      _errorMessage = '';
      _isLoading = true;

      dynamic response = await UserClient.register(
          username, email, password, other, isVehicle);
      if (response['success']) {
        _successMessage = response['message'];

        _accessToken = response['data']['token'];
        setToken(response['data']['token']);
        _isLoading = false;

        _userAuth = UserModel.fromJson(response['data']);
      } else {
        _isLoading = false;
        _userAuth = null;
        _errorMessage = response['message'];
      }
    } catch (e) {
      _isLoading = false;
      _errorMessage = 'Failed to register user: $e';
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
    final userId = await storage.read(key: 'userId');
    _accessToken = token;
    if (_accessToken != null && userId != null && userAuth == null) {
      try {
        dynamic data = await UserClient.fetchUser(int.parse(userId));
        _userAuth = data;
      } catch (e) {
        print(e);
      }
    }
    return _accessToken != null;
  }

  Future<void> setToken(String token) async {
    const storage = FlutterSecureStorage();
    await storage.write(key: 'jwt_token', value: token);
    final userAuth = this.userAuth;

    if (userAuth != null) {
      await storage.write(key: 'userId', value: userAuth.id.toString());
      await storage.write(key: 'userEmail', value: userAuth.email);
      await storage.write(key: 'userUsername', value: userAuth.username);
    }
    _accessToken = token;
    notifyListeners();
  }

  setSubscribe(bool value) {
    _subscribe = value;
    notifyListeners();
  }

  createUser(user) {
    if (user != null && user is Map<String, dynamic>) {
    } else {
      _userAuth = null;
    }
  }
}

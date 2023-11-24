import 'package:flutter/foundation.dart';
import 'package:trafic_app/api/user_client.dart';
import 'package:trafic_app/models/user_model.dart';
import 'package:trafic_app/viewmodels/auth_viewmodel.dart';

class UserViewModel with ChangeNotifier {
  UserModel? _user;
  bool _isLoading = false;
  String _errorMessage = '';

  UserModel? get user => _user;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchUser(int userId) async {
    try {
      _isLoading = true;
      notifyListeners();

      _user = await UserClient.fetchUser(userId);

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _errorMessage = 'Failed to fetch user: $e';
      notifyListeners();
    }
  }

  Future<void> updateUser(UserModel user) async {
    try {
      _isLoading = true;
      notifyListeners();

      await UserClient.updateUser(user);

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _errorMessage = 'Failed to update user: $e';
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
      _isLoading = true;
      notifyListeners();

      dynamic response = await UserClient.register(
          username, email, password, other, isVehicle);
      if (response['success']) {
        if (response['success']) {
          AuthViewModel authViewModel = AuthViewModel();
          authViewModel.setToken(response['data']['token']);
          _user = UserModel(
            id: response['data']['id'],
            username: response['data']['username'],
            email: response['data']['email'],
            work: response['data']['work'],
            vehicleNumber: response['data']['vehicleNumber'],
            isVehicle: response['data']['isVehicle'],
          );
        } else {
          _user = null;
          _errorMessage = response['message'];
        }
      }
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _errorMessage = 'Failed to fetch user: $e';
      notifyListeners();
    }
  }
}

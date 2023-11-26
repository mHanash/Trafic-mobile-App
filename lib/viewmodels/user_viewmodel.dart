import 'package:flutter/foundation.dart';
import 'package:trafic_app/api/user_client.dart';
import 'package:trafic_app/models/user_model.dart';

class UserViewModel with ChangeNotifier {
  UserModel? _user;
  bool _isLoading = false;
  String _errorMessage = '';
  String _successMessage = '';

  UserModel? get user => _user;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  String get successMessage => _successMessage;

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
}

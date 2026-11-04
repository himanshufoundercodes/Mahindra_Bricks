import 'package:flutter/material.dart';
import 'package:mahindra_bricks/repo/login_repo.dart';
import '../core/storage/login_sharedpreferences.dart';
import '../model/login_model.dart';

class LoginViewModel with ChangeNotifier {

  final LoginRepo _loginRepo = LoginRepo();

  bool _loading = false;
  bool get loading => _loading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  LoginModel? _loginModel;
  LoginModel? get loginModel => _loginModel;

  Future<bool> loginApi(String email, String password) async {

    _loading = true;
    _errorMessage = null;
    notifyListeners();

    try {

      var data = {
        "email": email.trim(),
        "password": password.trim(),
      };

      final response = await _loginRepo.loginApi(data);

      _loginModel = response;

      if (response.accessToken.isEmpty) {
        _errorMessage = 'Token not received';
        return false;
      }
      await PreferenceService.saveSession(
        token: response.accessToken,
        userId: response.id,
      );
      debugPrint("Login Success");
      debugPrint("User ID: ${response.id}");

      return true;

    } catch (e) {

      _errorMessage = e.toString();
      debugPrint("Login Error: $e");
      return false;

    } finally {

      _loading = false;
      notifyListeners();

    }
  }
}
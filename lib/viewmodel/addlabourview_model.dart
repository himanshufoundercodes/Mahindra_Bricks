import 'package:flutter/material.dart';
import 'package:mahindra_bricks/repo/login_repo.dart';
import '../core/storage/login_sharedpreferences.dart';
import '../model/addlabour_model.dart';
import '../model/login_model.dart';
import '../repo/addlabour_repo.dart';

class AddlabourviewModel with ChangeNotifier {

  final AddlabourRepo _AddlabourRepo = AddlabourRepo();

  bool _loading = false;
  bool get loading => _loading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  AddlabourModel? _addlabourModel;
  AddlabourModel? get addlabourModel => _addlabourModel;

  Future<bool> addlabourApi(
      String name,
      String mobile,
      String daily_rate
      ) async {
    _loading = true;
    _errorMessage = null;
    notifyListeners();

    try {

      var data = {
        "name": name.trim(),
        "mobile": mobile.trim(),
        "daily_rate": daily_rate.trim(),
      };

      final response = await _AddlabourRepo.addlabourApi(data);

      _addlabourModel = response;

      // if (response.accessToken.isEmpty) {
      //   _errorMessage = 'Token not received';
      //   return false;
      // }
      // await PreferenceService.saveSession(
      //   token: response.accessToken,
      //   userId: response.id,
      // );
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
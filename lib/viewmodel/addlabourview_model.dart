import 'package:flutter/material.dart';
import 'package:mahindra_bricks/repo/login_repo.dart';
import 'package:provider/provider.dart';
import '../core/storage/login_sharedpreferences.dart';
import '../model/addlabour_model.dart';
import '../model/login_model.dart';
import '../repo/addlabour_repo.dart';
import 'labour_viewmodel.dart';

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
      String daily_rate,
      BuildContext context,
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
     Provider.of<LabourListViewModel>(
        context,
        listen: false,
      ).LabourApi();

      debugPrint("Add Labour Successfull");
      debugPrint("User ID: ${response.id}");
      debugPrint("Labour Code: ${response.labour_code}");


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
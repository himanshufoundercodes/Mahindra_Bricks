import 'package:flutter/material.dart';
import 'package:mahindra_bricks/repo/profile_repo.dart';
import '../model/profile_model.dart';

class ProfileViewModel with ChangeNotifier {

  final ProfileRepo _profileRepo = ProfileRepo();

  bool _loading = false;
  bool get loading => _loading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  ProfileModel? _profileModel;
  ProfileModel? get profileModel => _profileModel;

  Future<bool> profileApi() async {

    _loading = true;
    _errorMessage = null;
    notifyListeners();

    try {

      final response = await _profileRepo.profileApi();

      _profileModel = response;

      debugPrint("Profile Successfully");
      debugPrint("User Name: ${response.name}");
      debugPrint("User Email: ${response.email}");

      return true;

    } catch (e) {

      _errorMessage = e.toString();
      debugPrint("Profile Error: $e");

      return false;

    } finally {

      _loading = false;
      notifyListeners();

    }
  }
}
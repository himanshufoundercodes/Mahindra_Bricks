
import 'package:flutter/material.dart';
import '../model/labour_model.dart';
import '../repo/labour_repo.dart';

class LabourListViewModel with ChangeNotifier {

  late labourListRepo _labourListRepo = labourListRepo();

  List<LabourListModel>? _labourListModel;

  List<LabourListModel>? get labourListModel => _labourListModel;

  bool _loading = false;
  bool get loading => _loading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> LabourApi() async {

    _loading = true;
    _errorMessage = null;
    notifyListeners();

    try {

      final response = await _labourListRepo.LabourApi();

      _labourListModel = response;

      debugPrint("Labour Listed Successfully");

      return true;

    } catch (e) {

      _errorMessage = e.toString();

      debugPrint("Labour Error: $e");

      return false;

    } finally {

      _loading = false;
      notifyListeners();

    }
  }
}

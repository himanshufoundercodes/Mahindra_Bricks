import 'package:flutter/material.dart';
import 'package:mahindra_bricks/model/labour_model.dart';
import 'package:mahindra_bricks/repo/labouredit_repo.dart';

class LabourViewModel extends ChangeNotifier {
  final LabourEditRepo _repo = LabourEditRepo();

  bool _loading = false;
  bool get loading => _loading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Data? _updatedData;
  Data? get updatedData => _updatedData;

  Future<bool> updateLabourApi(
    String id,
    Map<String, dynamic> data,
  ) async {
    _loading = true;
    _errorMessage = null;
    _updatedData = null;
    notifyListeners();

    try {
      dynamic response = await _repo.updateLabourApi(
        id,
        data,
      );
      debugPrint("Update Labour Response: $response");

      if (response != null && response is Map && response['data'] != null) {
        if (response['data'] is Map<String, dynamic>) {
          _updatedData = Data.fromJson(response['data'] as Map<String, dynamic>);
        }
      }

      return true;
    } catch (e) {
      _errorMessage = e.toString();
      debugPrint("Update Labour Error: $e");
      return false;
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}


import 'package:flutter/material.dart';
import 'package:mahindra_bricks/repo/delete_repo.dart';

class DeleteVehicleViewModel with ChangeNotifier {

  final _deleteVehicleRepository = DeleteVehicleRepository();

  bool _loading = false;

  bool get loading => _loading;

  Future<void> deleteVehicle(String id) async {
    _loading = true;
    notifyListeners();

    try {
      await _deleteVehicleRepository.deleteVehicleApi(id);
    } catch (e) {
      rethrow;
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}

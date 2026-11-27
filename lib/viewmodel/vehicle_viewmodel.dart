import 'package:flutter/material.dart';
import '../model/vehicle_model.dart';
import '../repo/vehicle_repo.dart';

class VehicleViewmodel with ChangeNotifier {
  final VehicleRepo _vehicleRepo = VehicleRepo();

  bool _loading = false;
  bool get loading => _loading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  List<VehicleModel> _vehicleList = [];
  List<VehicleModel> get vehicleList => _vehicleList;

  Future<bool> vehicleApi() async {
    _loading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _vehicleRepo.vehicleApi();

      _vehicleList = response;

      debugPrint("Vehicle Successfully Loaded");
      debugPrint("Total Vehicles: ${_vehicleList.length}");

      return true;
    } catch (e) {
      _errorMessage = e.toString();
      debugPrint("Vehicle Error: $e");
      return false;
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<bool> updateVehicleApi(String id, Map<String, dynamic> data) async {
    _loading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _vehicleRepo.updateVehicleApi(id, data);
      debugPrint("Update Vehicle Response: $response");
      await vehicleApi();
      return true;
    } catch (e) {
      _errorMessage = e.toString();
      debugPrint("Update Vehicle Error: $e");
      return false;
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}

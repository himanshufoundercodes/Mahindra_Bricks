import 'package:flutter/material.dart';
import 'package:mahindra_bricks/repo/addvehicle_repo.dart';

import '../model/addcategory_model.dart';
import '../model/addvehicle_model.dart';
import '../repo/addcategory_repo.dart';

class AddvehicleviewModel with ChangeNotifier {
  final AddvehicleRepo _addCategoryRepo = AddvehicleRepo();

  bool _loading = false;
  bool get loading => _loading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  AddVehicleModel? _addVehicleModel;
  AddVehicleModel? get addVehicleModel => _addVehicleModel;

  Future<bool> addvehicleApi(
    String vehicleName,
    String vehicleNumber,
    String driverName,
    String driverMobile,
    String text,
  ) async {
    _loading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      var data = {
        "vehicle_name": vehicleName,
        "vehicle_number": vehicleNumber,
        "driver_name": driverName,
        "driver_mobile": driverMobile,
        "capacity_pieces": text,
        "status": "1",
        "notes": "",
      };

      debugPrint("Category Data: $data");

      final response = await _addCategoryRepo.addvehicleApi(data);

      _addVehicleModel = response;

      debugPrint("Category Added Successfully");
      debugPrint("Category ID: ${response.id}");

      return true;
    } catch (e) {
      _errorMessage = e.toString();
      debugPrint("Add Category Error: $e");

      return false;
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}

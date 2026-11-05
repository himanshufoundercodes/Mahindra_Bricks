import 'package:flutter/material.dart';
import 'package:mahindra_bricks/repo/addvehicle_repo.dart';

import '../model/addcategory_model.dart';
import '../model/addclient_model.dart';
import '../model/addvehicle_model.dart';
import '../repo/addcategory_repo.dart';
import '../repo/addclient_repo.dart';

class AddclientviewModel with ChangeNotifier {
  final AddClientRepo _addClientRepo = AddClientRepo();

  bool _loading = false;
  bool get loading => _loading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  AddClientModel? _addClientModel;
  AddClientModel? get addClientModel => _addClientModel;

  get driverMobile => null;

  Future<bool>addClientApi(
      String companyName,
      String clientName,
      String clientNumber,
      String clientalternateNumber,
      String address,
      ) async {
    _loading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      var data = {
        "company_name": companyName.trim(),
        "contact_person": clientName.trim(),
        "mobile": clientNumber.trim(),
        "alternate_mobile": clientalternateNumber.trim(),
        "address": address.trim(),
        "status": "1",
      };

      debugPrint("Category Data: $data");

      final response = await _addClientRepo.addClientApi(data);

      _addClientModel = response;

      debugPrint("Client Added Successfully");
      debugPrint("Client ID: ${response.id}");

      return true;
    } catch (e) {
      _errorMessage = e.toString();
      debugPrint("Add client Error: $e");

      return false;
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}

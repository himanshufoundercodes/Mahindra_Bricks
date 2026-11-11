import 'package:flutter/material.dart';
import 'package:mahindra_bricks/repo/login_repo.dart';
import '../core/storage/login_sharedpreferences.dart';
import '../model/addproduction_model.dart';
import '../model/login_model.dart';
import '../repo/addproduction_repo.dart';

class AddproductionviewModel with ChangeNotifier {

  final AddproductionRepo _addproductionRepo= AddproductionRepo();

  bool _loading = false;
  bool get loading => _loading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  AddproductionModel? _addproductionModel;
  AddproductionModel? get addproductionModel => _addproductionModel;

  Future<bool> addproductionApi(dynamic productId, dynamic quantity_produced) async {

    _loading = true;
    _errorMessage = null;
    notifyListeners();

    try {

      var data = {
        "product_id": productId ?? 1,
        "quantity_produced": quantity_produced,
      };

      final response = await _addproductionRepo.addproductionApi(data);

      _addproductionModel = response;

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
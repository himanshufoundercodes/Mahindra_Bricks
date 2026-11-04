
import 'package:flutter/material.dart';
import '../model/addcement_model.dart';
import '../repo/addnewstock_repo.dart';

class AddcementstockViewmodel with ChangeNotifier {

  final AddnewstockRepo _addnewstockRepo = AddnewstockRepo();

  bool _loading = false;
  bool get loading => _loading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  AddCementModel? _addCementModel;
  AddCementModel? get addCementModel => _addCementModel;

  Future<bool> addCementStockApi(
      String quantity,
      String date,
      ) async {

    if (_loading) return false;

    _loading = true;
    _errorMessage = null;
    notifyListeners();

    try {

      debugPrint("========== ADD STOCK API ==========");
      debugPrint("Quantity: $quantity");
      debugPrint("Date: $date");

      final response =
      await _addnewstockRepo.addCementStockApi(
        quantity,
        date,
      );

      _addCementModel = response;

      debugPrint("========== SUCCESS ==========");
      debugPrint("ID: ${response.id}");
      debugPrint("Bags: ${response.bags}");
      debugPrint("Activity Date: ${response.activity_date}");
      debugPrint("Activity Type: ${response.activity_type}");

      return true;

    } catch (e, stackTrace) {

      _errorMessage = e.toString();

      debugPrint("========== ADD STOCK ERROR ==========");
      debugPrint("Error: $e");
      debugPrint("Error Type: ${e.runtimeType}");
      debugPrint("Stack Trace: $stackTrace");

      return false;

    } finally {

      _loading = false;
      notifyListeners();

    }
  }
}

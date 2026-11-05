
import 'package:flutter/material.dart';
import '../model/addcement_model.dart';
import '../model/recordCement_model.dart';
import '../repo/addnewstock_repo.dart';
import '../repo/addrecordstock_repo.dart';

class RecordCementViewModel with ChangeNotifier {

  final AddRecordStockRepo _addRecordStockRepo = AddRecordStockRepo();

  bool _loading = false;
  bool get loading => _loading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  RecordCementModel? _recordCementModel;
  RecordCementModel? get recordCementModel => _recordCementModel;

  Future<bool> recordCementStockApi(
      String quantity,
      String date,
      ) async {

    if (_loading) return false;

    _loading = true;
    _errorMessage = null;
    notifyListeners();

    try {

      debugPrint("ADD STOCK ");
      debugPrint("Quantity: $quantity");
      debugPrint("Date: $date");

      final response =
      await _addRecordStockRepo.recordCementStockApi(
        quantity,
        date,
      );
      _recordCementModel = response;
      debugPrint("ID: ${response.id}");
      debugPrint("Bags: ${response.bags}");
      debugPrint("Activity Date: ${response.activity_date}");
      debugPrint("Activity Type: ${response.activity_type}");

      return true;

    } catch (e, stackTrace) {

      _errorMessage = e.toString();
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

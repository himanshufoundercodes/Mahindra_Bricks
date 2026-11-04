import 'package:flutter/material.dart';
import '../model/cementstock_model.dart';
import '../repo/cementstock_repo.dart';

class CementStockViewModel with ChangeNotifier {
  final CementStockRepo _cementStockRepo = CementStockRepo();

  bool _loading = false;
  bool get loading => _loading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  CementStockModel? _cementStockModel;
  CementStockModel? get cementStockModel => _cementStockModel;

  Future<bool> cementStockApi() async {
    _loading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _cementStockRepo.cementStockApi();

      _cementStockModel = response;

      debugPrint("Cement Stock Successfully");
      debugPrint("Date: ${response.date}");
      debugPrint("Current Stock: ${response.summary?.current_stock}");
      debugPrint("Today Stock In: ${response.summary?.today_stock_in}");
      debugPrint("Today Used: ${response.summary?.today_used}");
      debugPrint("Closing Stock: ${response.summary?.closing_stock}");
      debugPrint("Unit: ${response.summary?.unit}");
      debugPrint("Min Stock Alert: ${response.summary?.min_stock_alert}");
      debugPrint("Stock Status: ${response.summary?.stock_status}");
      debugPrint("Formula: ${response.summary?.formula}");
      debugPrint("Today Activities: ${response.today_activities}");

      return true;
    } catch (e) {
      _errorMessage = e.toString();
      debugPrint("Cement Stock Error: $e");

      return false;
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}
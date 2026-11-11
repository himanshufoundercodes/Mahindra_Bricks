import 'package:flutter/material.dart';
import '../model/stocklist_model.dart';
import '../repo/stock_repo.dart';

class StocklistViewmodel with ChangeNotifier {

  final StockListRepo _stockListRepo = StockListRepo();

  List<StocklistModel> stockList = [];

  bool _loading = false;
  bool get loading => _loading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> StockListApi() async {

    _loading = true;
    _errorMessage = null;
    notifyListeners();

    try {

      final response = await _stockListRepo.StockListApi();

      stockList = response;

      debugPrint("Stock Listed Successfully");

      return true;

    } catch (e) {

      _errorMessage = e.toString();

      debugPrint("Stock Error: $e");

      return false;

    } finally {

      _loading = false;
      notifyListeners();

    }
  }
}
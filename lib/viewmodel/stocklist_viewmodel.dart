// import 'package:flutter/material.dart';
// import '../model/stocklist_model.dart';
// import '../repo/stock_repo.dart';
//
// class StocklistViewmodel with ChangeNotifier {
//
//   final StockListRepo _stockListRepo = StockListRepo();
//
//   bool _loading = false;
//   bool get loading => _loading;
//
//   String? _errorMessage;
//   String? get errorMessage => _errorMessage;
//
//   StockListModel? _stockListModel;
//   StockListModel? get stockListModel => _stockListModel;
//
//   void setStockModelData(StockListModel value) {
//     _stockListModel = value;
//     notifyListeners();
//   }
//
//   Future<bool> StockListApi() async {
//
//     _loading = true;
//     _errorMessage = null;
//     notifyListeners();
//
//     try {
//
//       final response = await _stockListRepo.StockListApi();
//
//       stockList = response;
//
//       debugPrint("Stock Listed Successfully");
//
//       return true;
//
//     } catch (e) {
//
//       _errorMessage = e.toString();
//
//       debugPrint("Stock Error: $e");
//
//       return false;
//
//     } finally {
//
//       _loading = false;
//       notifyListeners();
//
//     }
//   }
// }

import 'package:flutter/foundation.dart';
import 'package:mahindra_bricks/model/stocklist_model.dart';
import 'package:mahindra_bricks/repo/stock_repo.dart' show StockListRepo;


class StocklistViewmodel with ChangeNotifier {
  final _stockListRepo = StockListRepo();

  bool _loading = false;
  bool get loading => _loading;

  StockListModel? _stockListModel;
  StockListModel? get stockListModel => _stockListModel;

  void setStockModelData(StockListModel value) {
    _stockListModel = value;
    notifyListeners();
  }

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> stockListApi() async {
    setLoading(true);

    try {
      final response = await _stockListRepo.stockListApi();
      final model = StockListModel.fromJson(response);
      setStockModelData(model);
    } catch (e) {
      if (kDebugMode) print("ViewModel Error → $e");
    } finally {
      setLoading(false);
    }
  }
}
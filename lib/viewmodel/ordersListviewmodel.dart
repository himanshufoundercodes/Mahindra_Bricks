import 'package:flutter/material.dart';

import '../model/orderlist_model.dart';
import '../repo/client_repo.dart';
import '../repo/orderslist_repo.dart';

class OrdersListViewModel with ChangeNotifier {

  final OrdersListRepo _ordersListRepo = OrdersListRepo();

  OrderdsListModel? _ordersListModel;
  OrderdsListModel? get ordersListModel => _ordersListModel;

  bool _loading = false;
  bool get loading => _loading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> OrdersApi() async {

    _loading = true;
    _errorMessage = null;
    notifyListeners();

    try {

      final response = await _ordersListRepo.OrdersApi();

      _ordersListModel = response;

      debugPrint("Orders Listed Successfully");

      return true;

    } catch (e) {

      _errorMessage = e.toString();

      debugPrint("Category Error: $e");

      return false;

    } finally {

      _loading = false;
      notifyListeners();

    }
  }
}
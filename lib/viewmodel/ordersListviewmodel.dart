import 'package:flutter/material.dart';

import '../model/orderlist_model.dart';
import '../repo/orderslist_repo.dart';

class OrdersListViewModel with ChangeNotifier {

  final OrdersListRepo _ordersListRepo = OrdersListRepo();

  OrderdsListModel? _ordersListModel;
  OrderdsListModel? get ordersListModel => _ordersListModel;

  List<OrderdsDataModel> _allOrders = [];
  List<OrderdsDataModel> get allOrders => _allOrders;

  String _currentStatus = 'all';
  String get currentStatus => _currentStatus;

  bool _loading = false;
  bool get loading => _loading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  List<OrderdsDataModel> get filteredOrders {
    if (_ordersListModel == null) return [];
    final list = _ordersListModel!.data;
    if (_currentStatus == 'pending') {
      return list.where((order) {
        final oStatus = order.order_status.toLowerCase();
        final dStatus = order.dispatch_status.toLowerCase();
        return oStatus.contains('pending') || dStatus.contains('pending');
      }).toList();
    } else if (_currentStatus == 'dispatched') {
      return list.where((order) {
        final oStatus = order.order_status.toLowerCase();
        final dStatus = order.dispatch_status.toLowerCase();
        return oStatus.contains('dispatch') || dStatus.contains('dispatch');
      }).toList();
    }
    return list;
  }

  int get allCount {
    return _allOrders.isNotEmpty ? _allOrders.length : (_ordersListModel?.data.length ?? 0);
  }

  int get pendingCount {
    final list = _allOrders.isNotEmpty ? _allOrders : (_ordersListModel?.data ?? []);
    return list.where((order) {
      final oStatus = order.order_status.toLowerCase();
      final dStatus = order.dispatch_status.toLowerCase();
      return oStatus.contains('pending') || dStatus.contains('pending');
    }).length;
  }

  int get dispatchedCount {
    final list = _allOrders.isNotEmpty ? _allOrders : (_ordersListModel?.data ?? []);
    return list.where((order) {
      final oStatus = order.order_status.toLowerCase();
      final dStatus = order.dispatch_status.toLowerCase();
      return oStatus.contains('dispatch') || dStatus.contains('dispatch');
    }).length;
  }

  Future<bool> OrdersApi({String? status}) async {
    if (status != null) {
      _currentStatus = status;
    }

    _loading = true;
    _errorMessage = null;
    notifyListeners();

    try {

      final response = await _ordersListRepo.OrdersApi(status: _currentStatus);

      _ordersListModel = response;
      if (_currentStatus == 'all' || _allOrders.isEmpty) {
        _allOrders = response.data;
      }

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
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

  static bool _isDispatchedOrder(OrderdsDataModel order) {
    final oStatus = order.order_status.trim().toLowerCase();
    final dStatus = order.dispatch_status.trim().toLowerCase();

    if (oStatus.contains('not') ||
        oStatus.contains('pending') ||
        oStatus.contains('processing') ||
        dStatus.contains('not') ||
        dStatus.contains('pending') ||
        dStatus.contains('processing')) {
      return false;
    }

    if (oStatus.contains('dispatch') ||
        dStatus.contains('dispatch') ||
        oStatus == 'completed' ||
        dStatus == 'completed') {
      return true;
    }

    return false;
  }

  static bool _isPendingOrder(OrderdsDataModel order) {
    final oStatus = order.order_status.trim().toLowerCase();
    final dStatus = order.dispatch_status.trim().toLowerCase();

    if (oStatus == 'processing') {
      return false;
    }

    if (_isDispatchedOrder(order)) {
      return false;
    }

    if (oStatus == 'pending' ||
        dStatus.contains('pending') ||
        dStatus.contains('not')) {
      return true;
    }

    return oStatus.isEmpty || oStatus == 'pending';
  }

  List<OrderdsDataModel> get filteredOrders {
    final list = _allOrders.isNotEmpty
        ? _allOrders
        : (_ordersListModel?.data ?? []);

    if (_currentStatus == 'pending') {
      return list.where(_isPendingOrder).toList();
    } else if (_currentStatus == 'dispatched') {
      return list.where(_isDispatchedOrder).toList();
    }
    return list;
  }

  int get allCount {
    final list = _allOrders.isNotEmpty ? _allOrders : (_ordersListModel?.data ?? []);
    return list.length;
  }

  int get pendingCount {
    final list = _allOrders.isNotEmpty ? _allOrders : (_ordersListModel?.data ?? []);
    return list.where(_isPendingOrder).length;
  }

  int get completedCount {
    return allOrders.where((order) {
      return order.order_status.toLowerCase().trim() == 'completed';
    }).length;
  }

  int get dispatchedCount {
    final list = _allOrders.isNotEmpty ? _allOrders : (_ordersListModel?.data ?? []);
    return list.where(_isDispatchedOrder).length;
  }

  Future<bool> OrdersApi({String? status}) async {
    if (status != null) {
      _currentStatus = status;
    }

    _loading = true;
    _errorMessage = null;
    notifyListeners();

    try {

      final response = await _ordersListRepo.OrdersApi(status: 'all');

      _ordersListModel = response;
      _allOrders = response.data;

      debugPrint("Orders Listed Successfully: Total ${_allOrders.length}");

      return true;

    } catch (e) {

      _errorMessage = e.toString();

      debugPrint("Orders API Error: $e");

      return false;

    } finally {

      _loading = false;
      notifyListeners();

    }
  }
}
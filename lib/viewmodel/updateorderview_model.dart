import 'package:flutter/material.dart';
import 'package:mahindra_bricks/repo/updateorder_repo.dart';


class UpdateOrderViewModel with ChangeNotifier {

  final _pudateOrderRepo = UpdateOrderRepo();

  bool _loading = false;
  bool get loading => _loading;

  Future<bool> updateOrderApi(
      String id, dynamic data) async {

    _loading = true;
    notifyListeners();

    try {

      final response = await _pudateOrderRepo.updateOrderApi(
        id,
        data,
      );

      debugPrint("Update Order Response: $response");

      _loading = false;
      notifyListeners();

      return true;

    } catch (e) {

      debugPrint("Update Order Exception: $e");

      _loading = false;
      notifyListeners();

      return false;
    }
  }
}
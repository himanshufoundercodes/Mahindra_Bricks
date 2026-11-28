
import 'package:flutter/material.dart';
import 'package:mahindra_bricks/repo/neworder_repo.dart';

class AddOrderViewModel with ChangeNotifier {

  final AddOrderRepo _addOrderRepo =
  AddOrderRepo();

  bool _loading = false;
  bool get loading => _loading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> orderApi(
      String clientId,
      String deliveryDate,
      String deliveryAddress,
      String vehicleNumber,
      String paymentOption,
      String transportCharge,
      String labourCharge,
      String discount,
      String advanceAmount,
      List<Map<String, dynamic>> items,
      ) async {

    _loading = true;
    _errorMessage = null;
    notifyListeners();

    try {

      var data = {
        "client_id": clientId,
        "delivery_date": deliveryDate,
        "delivery_address": deliveryAddress,
        "delivery_location": deliveryAddress,
        "vehicle_number": vehicleNumber,
        "payment_option": paymentOption,
        "items": items,
        "transport_charge": transportCharge,
        "labour_charge": labourCharge,
        "discount": discount,
        "advance_amount": advanceAmount,
      };

      debugPrint("Order Data: $data");

      final response = await _addOrderRepo.orderApi(data);

      debugPrint("Order Saved Successfully");
      debugPrint("Response: $response");

      return true;

    } catch (e) {

      _errorMessage = e.toString();
      debugPrint("Add new order Error: $e");

      return false;

    } finally {

      _loading = false;
      notifyListeners();

    }
  }
}

import 'package:flutter/material.dart';
import 'package:mahindra_bricks/repo/recievedpayment_repo.dart';


class ReceivePaymentViewModel extends ChangeNotifier {

  final ReceivePaymentRepo _repo = ReceivePaymentRepo();

  bool _loading = false;
  bool get loading => _loading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Map<String, dynamic>? _paymentResponse;
  Map<String, dynamic>? get paymentResponse => _paymentResponse;

  // Receive Payment API

  Future<bool> receivePayment({
    required String url,
    required double amount,
    required int paymentOption,
  }) async {

    if (_loading) return false;

    _loading = true;
    _errorMessage = null;

    notifyListeners();

    try {

      Map<String, dynamic> body = {
        "amount": amount,
        "payment_option": paymentOption,
      };

      dynamic response = await _repo.receivePaymentApi(
        url,
        body,
      );

      _paymentResponse = Map<String, dynamic>.from(response);

      print("Payment Response: $response");

      _loading = false;
      notifyListeners();

      return true;

    } catch (e) {

      _errorMessage = e.toString();

      print("Payment Error: $e");

      return false;

    } finally {

      _loading = false;
      notifyListeners();

    }
  }
}
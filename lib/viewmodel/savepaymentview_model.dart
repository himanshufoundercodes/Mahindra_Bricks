import 'package:flutter/material.dart';
import 'package:mahindra_bricks/repo/login_repo.dart';
import 'package:mahindra_bricks/repo/savepayment_repo.dart';
import '../core/storage/login_sharedpreferences.dart';
import '../model/login_model.dart';

class SavePaymentViewModel with ChangeNotifier {

  final SavePaymentRepo _SavePaymentRepo = SavePaymentRepo();

  bool _loading = false;
  bool get loading => _loading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;


  Future<bool> savePaymentApi(
      String labourId,
      String amount,
      String paymentDate,
      String paymentMode,
      String paymentType,
      String notes
      ) async {

    _loading = true;
    _errorMessage = null;
    notifyListeners();

    try {

      var data = {
        "labour_id": labourId,
        "amount": amount,
        "payment_date": paymentDate,
        "payment_mode": paymentMode,
        "payment_type": paymentType,
        "notes": notes
      };

      final response = await _SavePaymentRepo.savePaymentApi(data);

      debugPrint("Payment Saved Successfully");
      debugPrint("Response: $response");

      return true;

    } catch (e) {

      _errorMessage = e.toString();
      debugPrint("SavePayment Error: $e");
      return false;

    } finally {

      _loading = false;
      notifyListeners();

    }
  }
}
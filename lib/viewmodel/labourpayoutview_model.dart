import 'package:flutter/material.dart';

import '../model/dailyattendence.dart';
import '../model/labourpayout_model.dart';
import '../model/orderlist_model.dart';
import '../repo/client_repo.dart';
import '../repo/dailyattendence_repo.dart';
import '../repo/labourpayout_repo.dart';
import '../repo/orderslist_repo.dart';

class LabourpayoutViewModel with ChangeNotifier {

  final LabourpayoutRepo _labourpayoutRepo = LabourpayoutRepo();

  LabourpayoutModel? _labourpayoutModel;
  LabourpayoutModel? get labourpayoutModel => _labourpayoutModel;

  bool _loading = false;
  bool get loading => _loading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> LabourpayoutApi({DateTime? startDate, DateTime? endDate}) async {

    _loading = true;
    _errorMessage = null;
    notifyListeners();

    try {

      final response = await _labourpayoutRepo.LabourpayoutApi(
        startDate: startDate,
        endDate: endDate,
      );

      _labourpayoutModel = response;

      debugPrint("Labour Payout Loaded Successfully");

      return true;

    } catch (e) {

      _errorMessage = e.toString();

      debugPrint("Labour Payout Error: $e");

      return false;

    } finally {

      _loading = false;
      notifyListeners();

    }
  }
}
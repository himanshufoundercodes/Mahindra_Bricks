import 'package:flutter/material.dart';
import 'package:mahindra_bricks/repo/report_repo.dart';

import '../model/dailyattendence.dart';
import '../model/orderlist_model.dart';
import '../model/reports_model.dart';
import '../repo/client_repo.dart';
import '../repo/dailyattendence_repo.dart';
import '../repo/orderslist_repo.dart';

class ReportsviewModel with ChangeNotifier {

  final ReportsRepo _reportsRepo = ReportsRepo();

  ReportsModel? _reportsModel;
  ReportsModel? get reportsModel => _reportsModel;

  bool _loading = false;
  bool get loading => _loading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> ReportsApi() async {

    _loading = true;
    _errorMessage = null;
    notifyListeners();

    try {

      final response = await _reportsRepo.ReportsApi();

      _reportsModel = response;

      debugPrint("Reports Listed Successfully");

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
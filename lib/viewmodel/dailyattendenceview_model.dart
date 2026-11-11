import 'package:flutter/material.dart';

import '../model/dailyattendence.dart';
import '../model/orderlist_model.dart';
import '../repo/client_repo.dart';
import '../repo/dailyattendence_repo.dart';
import '../repo/orderslist_repo.dart';

class DailyattendenceViewModel with ChangeNotifier {

  final DailyattendenceRepo _dailyattendenceRepo = DailyattendenceRepo();

  DailyattendenceModel? _dailyattendenceModel;
  DailyattendenceModel? get dailyattendenceModel => _dailyattendenceModel;

  bool _loading = false;
  bool get loading => _loading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> AttendenceApi() async {

    _loading = true;
    _errorMessage = null;
    notifyListeners();

    try {

      final response = await _dailyattendenceRepo.AttendenceApi();

      _dailyattendenceModel = response;

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
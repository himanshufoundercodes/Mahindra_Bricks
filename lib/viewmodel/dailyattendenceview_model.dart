import 'package:flutter/material.dart';
import '../model/dailyattendence.dart';
import '../repo/dailyattendence_repo.dart';

class DailyattendenceViewModel with ChangeNotifier {
  final DailyattendenceRepo _dailyattendenceRepo = DailyattendenceRepo();

  DailyattendenceModel? _dailyattendenceModel;
  DailyattendenceModel? get dailyattendenceModel => _dailyattendenceModel;

  bool _loading = false;
  bool get loading => _loading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> AttendenceApi({String? date}) async {
    _loading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _dailyattendenceRepo.AttendenceApi(date: date);

      _dailyattendenceModel = response;

      debugPrint("Attendance Listed Successfully for date: $date");

      return true;
    } catch (e) {
      _errorMessage = e.toString();

      debugPrint("Attendance Error: $e");

      return false;
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}


import 'package:flutter/material.dart';
import 'package:mahindra_bricks/repo/save_daily_attendence_repo.dart';

class SaveAttendanceViewmodel with ChangeNotifier {

  final SaveDailyAttendanceRepo _saveDailyAttendanceRepo =
  SaveDailyAttendanceRepo();

  bool _loading = false;
  bool get loading => _loading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> saveDailyAttendanceApi(
      String attendanceDate,
      List<Map<String, dynamic>> attendances,
      ) async {

    _loading = true;
    _errorMessage = null;
    notifyListeners();

    try {

      var data = {
        "attendance_date": attendanceDate,
        "attendances": attendances,
      };

      debugPrint("Attendance Data: $data");

      final response =
      await _saveDailyAttendanceRepo.saveDailyAttendanceApi(data);
      debugPrint("Attendance Saved Successfully");
      debugPrint("Response: $response");
      return true;

    } catch (e) {

      _errorMessage = e.toString();
      debugPrint("Save Attendance Error: $e");

      return false;

    } finally {

      _loading = false;
      notifyListeners();

    }
  }
}

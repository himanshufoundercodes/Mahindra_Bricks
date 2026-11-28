import 'package:flutter/material.dart';
import 'package:mahindra_bricks/model/attendence_model.dart';
import 'package:mahindra_bricks/repo/attendence_repo.dart';

class LabourDetailViewModel extends ChangeNotifier {

  final _myRepo = AttendenceRepo();

  AttendanceDetailsModel? labourDetailModel;

  bool loading = false;
  String? errorMessage;

  Future<void> labourDetailApi({
    required int id,
    required String fromDate,
    required String toDate,
  }) async {

    loading = true;
    errorMessage = null;
    notifyListeners();

    try {

      Map<String, dynamic> data = {
        'id': id,
        'from_date': fromDate,
        'to_date': toDate,
      };

      labourDetailModel = await _myRepo.labourDetailApi(data);

      loading = false;
      notifyListeners();

    } catch (e) {

      loading = false;
      errorMessage = e.toString();

      notifyListeners();
    }
  }
}

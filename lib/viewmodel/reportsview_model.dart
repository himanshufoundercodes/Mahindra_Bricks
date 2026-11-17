import 'package:flutter/material.dart';
import 'package:mahindra_bricks/model/reportlist_model.dart';
import 'package:mahindra_bricks/repo/report_repo.dart';

class ReportsviewModel with ChangeNotifier {
  final ReportsRepo _reportsRepo = ReportsRepo();

  ReportListModel? _reportListModel;
  ReportListModel? get reportListModel => _reportListModel;

  bool _loading = false;
  bool get loading => _loading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> ReportsApi({String? fromDate, String? toDate}) async {
    _loading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _reportsRepo.ReportsApi(
        fromDate: fromDate,
        toDate: toDate,
      );
      _reportListModel = response;
      debugPrint("Reports Listed Successfully");
      return true;
    } catch (e) {
      _errorMessage = e.toString();
      debugPrint("Reports Error: $e");
      return false;
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}

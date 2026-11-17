// import 'package:flutter/foundation.dart';
// import 'package:mahindra_bricks/model/reportlist_model.dart';
// import 'package:mahindra_bricks/repo/report_repo.dart';
//
//
// class ReportsListviewModel with ChangeNotifier {
//   final _reportsRepo = ReportsRepo();
//
//   bool _loading = false;
//   bool get loading => _loading;
//
//   ReportListModel? _reportListModel;
//   ReportListModel? get reportListModel => _reportListModel;
//
//   void setLoading(bool value) {
//     _loading = value;
//     notifyListeners();
//   }
//
//   void setReportsListModelData(ReportListModel value) {
//     _reportListModel = value;
//     notifyListeners();
//   }
//
//   Future<void> ReportsApi() async {
//     setLoading(true);
//
//     try {
//       final response = await _reportsRepo.ReportsApi();
//
//       final int statusCode = response['statusCode'] ?? 0;
//       final Map<String, dynamic> body = response['body'] ?? {};
//
//       if (statusCode == 200 || statusCode == 201) {
//         final model = ReportListModel.fromJson(body);
//         setReportsListModelData(model);
//       } else {
//         if (kDebugMode) print("❌ Error Status: $statusCode → $body");
//       }
//     } catch (e) {
//       if (kDebugMode) print("ViewModel Error → $e");
//     } finally {
//       setLoading(false);
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:mahindra_bricks/model/clistlist_model.dart';
import 'package:mahindra_bricks/model/reportlist_model.dart';
import 'package:mahindra_bricks/repo/report_repo.dart';
import '../repo/client_repo.dart';

class ReportsListviewModel with ChangeNotifier {

  final ReportsRepo _reportsRepo = ReportsRepo();

  bool _loading = false;
  bool get loading => _loading;
  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  ReportListModel? _reportListModel;
  ReportListModel? get reportListModel => _reportListModel;

  void setClientListModelData(ClientListModel value) {
    _reportListModel = value as ReportListModel?;
    notifyListeners();
  }

  Future<bool> ReportsApi() async {

    _loading = true;
    _errorMessage = null;
    notifyListeners();

    try {

      final response = await _reportsRepo.ReportsApi();

      _reportListModel = response as ReportListModel?;

      debugPrint("Client Listed Successfully");

      return true;

    } catch (e) {

      _errorMessage = e.toString();

      debugPrint("Client Error: $e");

      return false;

    } finally {

      _loading = false;
      notifyListeners();

    }
  }
}
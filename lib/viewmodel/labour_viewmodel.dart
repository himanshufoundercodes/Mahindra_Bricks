//
// import 'package:flutter/material.dart';
// import '../model/labour_model.dart';
// import '../repo/labour_repo.dart';
//
// class LabourListViewModel with ChangeNotifier {
//
//   late labourListRepo _labourListRepo = labourListRepo();
//
//   List<LabourListModel>? _labourListModel;
//
//   List<LabourListModel>? get labourListModel => _labourListModel;
//
//   bool _loading = false;
//   bool get loading => _loading;
//
//   String? _errorMessage;
//   String? get errorMessage => _errorMessage;
//
//   Future<bool> LabourApi() async {
//
//     _loading = true;
//     _errorMessage = null;
//     notifyListeners();
//
//     try {
//
//       final response = await _labourListRepo.LabourApi();
//
//       _labourListModel = response;
//
//       debugPrint("Labour Listed Successfully");
//
//       return true;
//
//     } catch (e) {
//
//       _errorMessage = e.toString();
//
//       debugPrint("Labour Error: $e");
//
//       return false;
//
//     } finally {
//
//       _loading = false;
//       notifyListeners();
//
//     }
//   }
// }


import 'package:flutter/material.dart';

import '../model/labour_model.dart';
import '../model/orderlist_model.dart';
import '../repo/client_repo.dart';
import '../repo/labour_repo.dart';
import '../repo/orderslist_repo.dart';

class LabourListViewModel with ChangeNotifier {

  final LabourListRepo _labourListRepo = LabourListRepo();

  LabourListModel? _labourListModel;
  LabourListModel? get labourListModel => _labourListModel;

  bool _loading = false;
  bool get loading => _loading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> LabourApi() async {

    _loading = true;
    _errorMessage = null;
    notifyListeners();

    try {

      final response = await _labourListRepo.LabourApi();

      _labourListModel = response;

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
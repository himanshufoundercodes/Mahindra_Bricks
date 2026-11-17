import 'package:flutter/material.dart';
import 'package:mahindra_bricks/model/clistlist_model.dart';
import '../repo/client_repo.dart';

class ClientListViewModel with ChangeNotifier {

  final ClientRepo _clientRepo = ClientRepo();

  bool _loading = false;
  bool get loading => _loading;
  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  ClientListModel? _clientListModel;
  ClientListModel? get clientListModel => _clientListModel;

  void setClientListModelData(ClientListModel value) {
    _clientListModel = value;
    notifyListeners();
  }

  Future<bool> clintApi() async {

    _loading = true;
    _errorMessage = null;
    notifyListeners();

    try {

      final response = await _clientRepo.clintApi();

      _clientListModel = response;

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
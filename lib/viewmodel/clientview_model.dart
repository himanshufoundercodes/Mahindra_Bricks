import 'package:flutter/material.dart';
import 'package:mahindra_bricks/model/clistlist_model.dart';
import 'package:mahindra_bricks/repo/category_repo.dart';
import '../model/category_model.dart';
import '../repo/client_repo.dart';

class ClientListViewModel with ChangeNotifier {

  final ClientRepo _clientRepo = ClientRepo();

  List<ClientListModel> clientList = [];

  bool _loading = false;
  bool get loading => _loading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> clintApi() async {

    _loading = true;
    _errorMessage = null;
    notifyListeners();

    try {

      final response = await _clientRepo.clintApi();

      clientList = response;

      debugPrint("Client Listed Successfully");

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
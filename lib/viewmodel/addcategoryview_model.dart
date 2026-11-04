import 'package:flutter/material.dart';
import '../model/addcategory_model.dart';
import '../repo/addcategory_repo.dart';

class AddcategoryviewModel with ChangeNotifier {

  final AddcategoryRepo _addCategoryRepo = AddcategoryRepo();

  bool _loading = false;
  bool get loading => _loading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  AddCategoryModel? _addCategoryModel;
  AddCategoryModel? get addCategoryModel => _addCategoryModel;

  Future<bool> addcategoryApi(String category, String description) async {

    _loading = true;
    _errorMessage = null;
    notifyListeners();

    try {

      var data = {
        "name": category,
        "description": description,
      };

      debugPrint("Category Data: $data");

      final response = await _addCategoryRepo.AddcategoryApi(data);

      _addCategoryModel = response;

      debugPrint("Category Added Successfully");
      debugPrint("Category ID: ${response.id}");

      return true;

    } catch (e) {

      _errorMessage = e.toString();
      debugPrint("Add Category Error: $e");

      return false;

    } finally {

      _loading = false;
      notifyListeners();

    }
  }
}
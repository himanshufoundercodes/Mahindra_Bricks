import 'package:flutter/material.dart';
import 'package:mahindra_bricks/repo/category_repo.dart';
import '../model/category_model.dart';

class CategoryViewModel with ChangeNotifier {

  final CategoryRepo _categoryRepo = CategoryRepo();

  List<CategoryModel> categoryList = [];

  bool _loading = false;
  bool get loading => _loading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> categoryApi() async {

    _loading = true;
    _errorMessage = null;
    notifyListeners();

    try {

      final response = await _categoryRepo.categoryApi();

      categoryList = response;

      debugPrint("Category Successfully");

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
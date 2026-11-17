import 'package:flutter/material.dart';

import '../model/orderlist_model.dart';
import '../model/productdetail_model.dart';
import '../repo/client_repo.dart';
import '../repo/orderslist_repo.dart';
import '../repo/productDetails_repo.dart';

class ProductDetailsViewModel with ChangeNotifier {

  final ProductdetailsRepo _productdetailsRepo = ProductdetailsRepo();

  ProductDetailModel? _productDetailModel;
  ProductDetailModel? get productDetailModel => _productDetailModel;

  bool _loading = false;
  bool get loading => _loading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> ProductdetailsApi() async {

    _loading = true;
    _errorMessage = null;
    notifyListeners();

    try {

      final response = await _productdetailsRepo.ProductdetailsApi();

      _productDetailModel = response;

      debugPrint("ProductDetails Listed Successfully");

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
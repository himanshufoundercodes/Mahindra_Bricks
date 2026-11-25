import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mahindra_bricks/Constant/Constant_bottomnav.dart'
    show CustomBottomNavBar;
import 'package:mahindra_bricks/repo/addproduct_repo.dart';
import 'package:mahindra_bricks/utils/utils.dart';
import 'package:mahindra_bricks/viewmodel/user_view_model.dart';

class AddNewProductViewModel with ChangeNotifier {
  final AddProductRepo _addProductRepo = AddProductRepo();

  bool _loading = false;
  bool get loading => _loading;

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<bool> addProductApi({
    String? productId,
    required File? productImage,
    required String productName,
    required String sku,
    required String category,
    required String productType,
    required String lengthMm,
    required String widthMm,
    required String heightMm,
    required String colour,
    required String initialQuantity,
    required String minStockAlert,
    required String costPrice,
    required String sellingPrice,
    required String description,
    required String productStatus,
    required BuildContext context,
  }) async {
    setLoading(true);
    Map<String, String> fields = {
      if (productId != null && productId.isNotEmpty) "product_id": productId,
      if (productId != null && productId.isNotEmpty) "id": productId,
      if (productId != null && productId.isNotEmpty) "_method": "PUT",
      "product_name": productName,
      "sku": sku,
      "category": category,
      "product_type": productType,
      "length_mm": lengthMm,
      "width_mm": widthMm,
      "height_mm": heightMm,
      "colour": colour,
      "initial_quantity": initialQuantity,
      "min_stock_alert": minStockAlert,
      "cost_price": costPrice,
      "selling_price": sellingPrice,
      "description": description,
      "product_status": productStatus,
    };

    Map<String, dynamic> files = {"product_images": productImage};

    //  PRINT REQUEST DATA (DEBUG)
    print("=================== 📤 JOB REQUEST DEBUG ===================");
    print("➡ URL: https://yoyomiles.codescarts.com/api/job_request");

    print("\n TEXT FIELDS:");
    fields.forEach((key, value) {
      print("  $key : $value");
    });

    print("\n FILE FIELDS:");
    // print("  profile_photo → ${profilePhoto.path}");

    print("============================================================\n");

    try {
      final response = await _addProductRepo.addProductApi(
        fields,
        files,
        productId: productId,
      );

      print("FULL RESPONSE: $response");

      if (response["message"] == "Product created successfully." ||
          response["message"] == "Product updated successfully." ||
          response["status"] == true ||
          response["status"] == 200 ||
          response["status"] == "success" ||
          response["message"]?.toString().toLowerCase().contains("success") ==
              true) {
        Utils.showSuccessMessage(
          context,
          response["message"] ??
              (productId != null
                  ? "Product updated successfully"
                  : "Product added successfully"),
        );
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const CustomBottomNavBar(initialIndex: 1),
          ),
          (route) => false,
        );

        return true;
      } else {
        Utils.showErrorMessage(
          context,
          response["message"] ?? "Something went wrong!",
        );

        return false;
      }
    } catch (e) {
      if (kDebugMode) print("❌ ViewModel Error → $e");

      // Extracting a cleaner error message if it's a string exception from network layer
      String errorMessage = "Request failed!";
      if (e.toString().contains("Invalid Request:")) {
        errorMessage = e.toString().replaceFirst("Invalid Request:", "").trim();
      } else if (e.toString().startsWith("Exception: ")) {
        errorMessage = e.toString().replaceFirst("Exception: ", "").trim();
      } else {
        errorMessage = e.toString();
      }

      Utils.showErrorMessage(context, errorMessage);
      return false;
    } finally {
      setLoading(false);
    }
  }
}

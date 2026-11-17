
import 'package:flutter/foundation.dart';
import 'package:mahindra_bricks/core/constant/api_constant.dart';
import 'package:mahindra_bricks/helper/network/network_api_services.dart';

class AddProductRepo {

  final NetworkApiServices _apiServices = NetworkApiServices();

  // Add Product API
  Future<dynamic> addProductApi(
      Map<String, String> fields,
      Map<String, dynamic> files,
      ) async {
    try {

      dynamic response = await _apiServices.getPostApiFormData(
        ApiConstants.createProductUrl,
        fields,
        files,
      );

      return response;

    } catch (e) {

      if (kDebugMode) {
        print("❌ Error in addProductRepo → $e");
      }

      rethrow;
    }
  }

}

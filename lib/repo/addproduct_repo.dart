import 'package:flutter/foundation.dart';
import 'package:mahindra_bricks/core/constant/api_constant.dart';
import 'package:mahindra_bricks/helper/network/network_api_services.dart';

class AddProductRepo {
  final NetworkApiServices _apiServices = NetworkApiServices();

  // Add / Edit Product API
  Future<dynamic> addProductApi(
    Map<String, String> fields,
    Map<String, dynamic> files, {
    String? productId,
  }) async {
    if (productId == null || productId.trim().isEmpty) {
      return await _apiServices.getPostApiFormData(
        ApiConstants.createProductUrl,
        fields,
        files,
      );
    }

    final String cleanId = productId.trim();

    // Candidate endpoints to try for updating product
    final List<String> candidateUrls = [
      '${ApiConstants.editProductUrl}/$cleanId',
      ApiConstants.editProductUrl,
      '${ApiConstants.baseUrl}updateProduct/$cleanId',
      '${ApiConstants.baseUrl}updateProduct',
      '${ApiConstants.baseUrl}products/$cleanId',
    ];

    dynamic lastException;
    for (int i = 0; i < candidateUrls.length; i++) {
      final url = candidateUrls[i];
      try {
        if (kDebugMode) {
          print("🔄 Trying update product URL [$i]: $url");
        }
        dynamic response = await _apiServices.getPostApiFormData(
          url,
          fields,
          files,
        );
        return response;
      } catch (e) {
        lastException = e;
        String errStr = e.toString().toLowerCase();
        if (errStr.contains("404") ||
            errStr.contains("resource not found") ||
            errStr.contains("unauthorised request") ||
            errStr.contains("not found")) {
          if (kDebugMode) {
            print("⚠️ URL failed ($url): $e. Trying next endpoint fallback...");
          }
          continue;
        }
        rethrow;
      }
    }

    if (lastException != null) {
      throw lastException;
    }
  }
}

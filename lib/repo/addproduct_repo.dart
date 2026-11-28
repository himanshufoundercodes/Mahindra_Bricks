import 'dart:io';

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
    List<String> fileKeysToTry = ["product_image", "image", "product_images"];

    // Find File object if provided
    File? imageFile;
    for (var entry in files.entries) {
      if (entry.value is File) {
        imageFile = entry.value as File;
        break;
      }
    }

    if (productId == null || productId.trim().isEmpty) {
      if (imageFile == null) {
        return await _apiServices.getPostApiFormData(
          ApiConstants.createProductUrl,
          fields,
          {},
        );
      }

      dynamic lastErr;
      for (String key in fileKeysToTry) {
        try {
          return await _apiServices.getPostApiFormData(
            ApiConstants.createProductUrl,
            fields,
            {key: imageFile},
          );
        } catch (e) {
          lastErr = e;
          if (e.toString().contains("Unexpected file field")) {
            continue;
          }
          rethrow;
        }
      }
      if (lastErr != null) throw lastErr;
    }

    // Updating product
    final String cleanId = (productId ?? '').trim();

    final List<String> candidateUrls = [
      '${ApiConstants.editProductUrl}/$cleanId',
      ApiConstants.editProductUrl,
      '${ApiConstants.baseUrl}products/$cleanId',
      '${ApiConstants.baseUrl}updateProduct/$cleanId',
    ];

    dynamic lastException;

    for (String url in candidateUrls) {
      List<Map<String, dynamic>> filePayloadsToTry = [];
      if (imageFile != null) {
        for (String k in fileKeysToTry) {
          filePayloadsToTry.add({k: imageFile});
        }
      } else {
        filePayloadsToTry.add({});
      }

      for (Map<String, dynamic> currentFiles in filePayloadsToTry) {
        // 1. Try PUT request
        try {
          if (kDebugMode) {
            print("🔄 Trying update product PUT: $url with files: ${currentFiles.keys}");
          }
          dynamic response = await _apiServices.putFormDataApiResponse(
            url,
            fields,
            currentFiles,
          );
          return response;
        } catch (e) {
          lastException = e;
          if (e.toString().contains("Unexpected file field")) {
            if (kDebugMode) {
              print("⚠️ File field key unexpected for $url: ${currentFiles.keys}. Trying next key...");
            }
            continue;
          }
          String errStr = e.toString().toLowerCase();
          if (!errStr.contains("404") &&
              !errStr.contains("resource not found") &&
              !errStr.contains("unauthorised request") &&
              !errStr.contains("not found")) {
            rethrow;
          }
        }

        // 2. Try POST request
        try {
          if (kDebugMode) {
            print("🔄 Trying update product POST: $url with files: ${currentFiles.keys}");
          }
          dynamic response = await _apiServices.getPostApiFormData(
            url,
            fields,
            currentFiles,
          );
          return response;
        } catch (e) {
          lastException = e;
          if (e.toString().contains("Unexpected file field")) {
            if (kDebugMode) {
              print("⚠️ File field key unexpected for $url: ${currentFiles.keys}. Trying next key...");
            }
            continue;
          }
          String errStr = e.toString().toLowerCase();
          if (errStr.contains("404") ||
              errStr.contains("resource not found") ||
              errStr.contains("unauthorised request") ||
              errStr.contains("not found")) {
            continue;
          }
          rethrow;
        }
      }
    }

    if (lastException != null) {
      throw lastException;
    }
  }
}

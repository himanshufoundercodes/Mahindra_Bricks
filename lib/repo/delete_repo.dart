import 'package:flutter/foundation.dart';
import 'package:mahindra_bricks/core/constant/api_constant.dart';
import 'package:mahindra_bricks/helper/network/base_api_services.dart';
import 'package:mahindra_bricks/helper/network/network_api_services.dart';

class DeleteVehicleRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> deleteVehicleApi(String id) async {
    List<String> urlsToTry = [
      '${ApiConstants.deleteVehicleUrl}/$id',
      '${ApiConstants.baseUrl}deleteVehicles/$id',
      '${ApiConstants.baseUrl}deleteVehicle/$id',
      '${ApiConstants.baseUrl}vehicles/$id',
    ];

    Object? lastError;

    // Try HTTP DELETE first
    for (String url in urlsToTry) {
      try {
        dynamic response = await _apiServices.getDeleteApiResponse(url);
        return response;
      } catch (e) {
        lastError = e;
        if (kDebugMode) {
          print("DELETE request failed for $url: $e");
        }
      }
    }

    // Try HTTP POST as fallback
    for (String url in urlsToTry) {
      try {
        dynamic response = await _apiServices.getPostApiResponse(url, {});
        return response;
      } catch (e) {
        lastError = e;
        if (kDebugMode) {
          print("POST delete request failed for $url: $e");
        }
      }
    }

    if (lastError != null) throw lastError;
  }
}

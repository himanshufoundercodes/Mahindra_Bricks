import 'package:flutter/foundation.dart';
import 'package:mahindra_bricks/core/constant/api_constant.dart';
import 'package:mahindra_bricks/helper/network/network_api_services.dart';

import '../model/vehicle_model.dart';

class VehicleRepo {
  final NetworkApiServices _apiServices = NetworkApiServices();

  Future<List<VehicleModel>> vehicleApi() async {
    dynamic response = await _apiServices.getGetApiResponse(
      ApiConstants.vehicleUrl,
    );

    debugPrint("Vehicle API Response: $response");

    List<VehicleModel> vehicleList = [];

    if (response != null && response['data'] != null) {
      for (var item in response['data']) {
        vehicleList.add(
          VehicleModel.fromJson(item),
        );
      }
    }

    return vehicleList;
  }

  Future<dynamic> updateVehicleApi(String id, Map<String, dynamic> data) async {
    final String url = '${ApiConstants.updateVehicleUrl}/$id';
    try {
      dynamic response = await _apiServices.getPutApiResponse(url, data);
      return response;
    } catch (e) {
      if (kDebugMode) {
        print('PUT Update Vehicle Failed, trying POST: $e');
      }
      try {
        dynamic response = await _apiServices.getPostApiResponse(url, data);
        return response;
      } catch (_) {
        rethrow;
      }
    }
  }
}

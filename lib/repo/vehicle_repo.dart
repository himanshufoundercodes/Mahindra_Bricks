
import 'package:flutter/foundation.dart';
import 'package:mahindra_bricks/core/constant/api_constant.dart';
import 'package:mahindra_bricks/helper/network/base_api_services.dart';
import 'package:mahindra_bricks/helper/network/network_api_services.dart';

import '../model/vehicle_model.dart';

class VehicleRepo {

  final BaseApiServices _apiServices = NetworkApiServices();

  Future<List<VehicleModel>> vehicleApi() async {

    dynamic response = await _apiServices.getGetApiResponse(
      ApiConstants.vehicleUrl,
    );

    debugPrint("Vehicle API Response: $response");

    List<VehicleModel> vehicleList = [];

    for (var item in response['data']) {

      vehicleList.add(
        VehicleModel.fromJson(item),
      );

    }

    return vehicleList;
  }
}

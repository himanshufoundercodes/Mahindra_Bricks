
import 'package:flutter/foundation.dart';
import 'package:mahindra_bricks/core/constant/api_constant.dart';
import 'package:mahindra_bricks/helper/network/base_api_services.dart';
import 'package:mahindra_bricks/helper/network/network_api_services.dart';

import '../model/addcement_model.dart';

class AddnewstockRepo {

  final BaseApiServices _apiServices = NetworkApiServices();

  Future<AddCementModel> addCementStockApi(
      String quantity,
      String date,
      ) async {

    dynamic response = await _apiServices.getPostApiResponse(
      ApiConstants.addCementStockUrl,
      {
        "bags": quantity,
        "activity_date": date,
      },
    );

    debugPrint("========== ADD STOCK RESPONSE ==========");
    debugPrint("Response: $response");
    debugPrint("Response Type: ${response.runtimeType}");
    debugPrint("Activity Type: ${response['activity'].runtimeType}");

    final activity = response['activity'];

    if (activity is! Map<String, dynamic>) {
      throw Exception('Invalid activity response from API');
    }

    return AddCementModel.fromJson(activity);
  }
}

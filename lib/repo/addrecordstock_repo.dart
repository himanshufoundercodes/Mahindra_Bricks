
import 'package:flutter/foundation.dart';
import 'package:mahindra_bricks/core/constant/api_constant.dart';
import 'package:mahindra_bricks/helper/network/base_api_services.dart';
import 'package:mahindra_bricks/helper/network/network_api_services.dart';
import '../model/recordCement_model.dart';

class AddRecordStockRepo{

  final BaseApiServices _apiServices = NetworkApiServices();

  Future<RecordCementModel> recordCementStockApi(
      String quantity,
      String date,
      ) async {

    dynamic response = await _apiServices.getPostApiResponse(
      ApiConstants.recordCementUrl,
      {
        "number_of_bags": int.parse(quantity),
        "activity_date": date,
      },
    );

    debugPrint("Request Body: ${{
      "number_of_bags": int.parse(quantity),
      "activity_date": date,
    }}");

    debugPrint("Response: $response");

    final activity = response['activity'];

    if (activity is! Map<String, dynamic>) {
      throw Exception('Invalid activity response from API');
    }

    return RecordCementModel.fromJson(activity);
  }
}

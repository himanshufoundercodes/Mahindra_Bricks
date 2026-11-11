
import 'package:flutter/foundation.dart';
import 'package:mahindra_bricks/core/constant/api_constant.dart';
import 'package:mahindra_bricks/helper/network/base_api_services.dart';
import 'package:mahindra_bricks/helper/network/network_api_services.dart';
import '../model/dailyattendence.dart';
import '../model/orderlist_model.dart';

class DailyattendenceRepo{

  final BaseApiServices _apiServices = NetworkApiServices();

  Future<DailyattendenceModel> AttendenceApi() async {

    try {

      dynamic response = await _apiServices.getGetApiResponse(
        ApiConstants.attendenceUrl,
      );

      return DailyattendenceModel.fromJson(response);

    } catch (e) {

      if (kDebugMode) {
        print('Category API Error: $e');
      }

      rethrow;
    }
  }
}

import 'package:flutter/foundation.dart';
import 'package:mahindra_bricks/core/constant/api_constant.dart';
import 'package:mahindra_bricks/helper/network/base_api_services.dart';
import 'package:mahindra_bricks/helper/network/network_api_services.dart';
class SaveDailyAttendanceRepo{
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> saveDailyAttendanceApi(dynamic data) async {

    try {
      dynamic response =
      await _apiServices.getPostApiResponse(ApiConstants.saveAttendanceUrl, data);
      return response;
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during authApi: $e');
      }
      rethrow;
    }
  }
}
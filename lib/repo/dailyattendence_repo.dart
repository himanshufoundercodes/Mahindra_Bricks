import 'package:flutter/foundation.dart';
import 'package:mahindra_bricks/core/constant/api_constant.dart';
import 'package:mahindra_bricks/helper/network/base_api_services.dart';
import 'package:mahindra_bricks/helper/network/network_api_services.dart';
import '../model/dailyattendence.dart';

class DailyattendenceRepo {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<DailyattendenceModel> AttendenceApi({String? date}) async {
    try {
      String url = ApiConstants.attendenceUrl;
      if (date != null && date.trim().isNotEmpty) {
        url = '$url?date=${date.trim()}';
      }

      dynamic response = await _apiServices.getGetApiResponse(url);

      return DailyattendenceModel.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print('Attendance API Error: $e');
      }

      rethrow;
    }
  }
}


import 'package:flutter/foundation.dart';
import 'package:mahindra_bricks/core/constant/api_constant.dart';
import 'package:mahindra_bricks/helper/network/base_api_services.dart';
import 'package:mahindra_bricks/helper/network/network_api_services.dart';
import '../model/dailyattendence.dart';
import '../model/orderlist_model.dart';
import '../model/reports_model.dart';

class ReportsRepo{

  final BaseApiServices _apiServices = NetworkApiServices();

  Future<ReportsModel> ReportsApi() async {

    try {

      dynamic response = await _apiServices.getGetApiResponse(
        ApiConstants.reportsUrl,
      );

      return ReportsModel.fromJson(response);

    } catch (e) {

      if (kDebugMode) {
        print('Category API Error: $e');
      }

      rethrow;
    }
  }
}

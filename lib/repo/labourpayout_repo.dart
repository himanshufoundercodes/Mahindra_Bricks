
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:mahindra_bricks/core/constant/api_constant.dart';
import 'package:mahindra_bricks/helper/network/base_api_services.dart';
import 'package:mahindra_bricks/helper/network/network_api_services.dart';
import '../model/dailyattendence.dart';
import '../model/labourpayout_model.dart';
import '../model/orderlist_model.dart';

class LabourpayoutRepo{

  final BaseApiServices _apiServices = NetworkApiServices();

  Future<LabourpayoutModel> LabourpayoutApi({DateTime? startDate, DateTime? endDate}) async {

    try {
      String url = ApiConstants.labourpayoutUrl;
      if (startDate != null && endDate != null) {
        final startFormatted = DateFormat('yyyy-MM-dd').format(startDate);
        final endFormatted = DateFormat('yyyy-MM-dd').format(endDate);
        url = '$url?start_date=$startFormatted&end_date=$endFormatted';
      }

      dynamic response = await _apiServices.getGetApiResponse(
        url,
      );

      return LabourpayoutModel.fromJson(response);

    } catch (e) {

      if (kDebugMode) {
        print('Labour Payout API Error: $e');
      }

      rethrow;
    }
  }
}

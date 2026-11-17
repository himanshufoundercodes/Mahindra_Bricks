import 'package:flutter/foundation.dart';
import 'package:mahindra_bricks/core/constant/api_constant.dart';
import 'package:mahindra_bricks/helper/network/network_api_services.dart';


class PaymentHistoryRepo {

  final NetworkApiServices _apiServices = NetworkApiServices();

  Future<Map<String, dynamic>> labourPayoutHistoryApi({dynamic labourId}) async {
    try {
      final String url = (labourId != null && labourId.toString().isNotEmpty)
          ? '${ApiConstants.baseUrl}labour/$labourId/payments'
          : ApiConstants.labourPayoutHistoryUrl;

      final response = await _apiServices.getGetApiResponse(url);
      return response;

    } catch (e) {
      if (kDebugMode) {
        print("Repo Error in labourPayoutHistoryApi → $e");
      }
      rethrow;
    }
  }
}
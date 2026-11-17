import 'package:flutter/foundation.dart';
import 'package:mahindra_bricks/core/constant/api_constant.dart';
import 'package:mahindra_bricks/helper/network/network_api_services.dart';


class LabourPayoutDetailRepo{

  final NetworkApiServices _apiServices = NetworkApiServices();

  Future<Map<String, dynamic>> labourPayoutDetailApi() async {
    try {
      final response = await _apiServices.getGetApiResponse(
        ApiConstants.labourPayoutDetailUrl,
      );
      return response;

    } catch (e) {
      if (kDebugMode) {
        print("Repo Error in categoriesApi → $e");
      }
      rethrow;
    }
  }
}
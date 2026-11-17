import 'package:flutter/foundation.dart';
import 'package:mahindra_bricks/core/constant/api_constant.dart';
import 'package:mahindra_bricks/helper/network/network_api_services.dart';

class UpdateOrderRepo {

  final _apiServices = NetworkApiServices();

  Future<dynamic> updateOrderApi(
      String id, dynamic data) async {

    final String url = '${ApiConstants.updateOrderUrl}/$id';
    try {

      dynamic response = await _apiServices.getPutApiResponse(
        url,
        data,
      );

      return response;

    } catch (e) {
      if (kDebugMode) {
        print('PUT Update Order Failed, trying POST: $e');
      }
      try {
        dynamic response = await _apiServices.getPostApiResponse(
          url,
          data,
        );
        return response;
      } catch (_) {
        rethrow;
      }
    }
  }
}

import 'package:flutter/foundation.dart';
import 'package:mahindra_bricks/core/constant/api_constant.dart';
import 'package:mahindra_bricks/helper/network/base_api_services.dart';
import 'package:mahindra_bricks/helper/network/network_api_services.dart';
import '../model/orderlist_model.dart';

class OrdersListRepo {

  final BaseApiServices _apiServices = NetworkApiServices();

  Future<OrderdsListModel> OrdersApi({String? status}) async {

    try {

      String url = ApiConstants.ordersUrl;
      if (status != null && status.isNotEmpty && status != 'all') {
        url = '$url?status=$status';
      }

      dynamic response = await _apiServices.getGetApiResponse(
        url,
      );

      return OrderdsListModel.fromJson(response);

    } catch (e) {

      if (kDebugMode) {
        print('Category API Error: $e');
      }

      rethrow;
    }
  }
}

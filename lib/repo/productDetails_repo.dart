
import 'package:flutter/foundation.dart';
import 'package:mahindra_bricks/core/constant/api_constant.dart';
import 'package:mahindra_bricks/helper/network/base_api_services.dart';
import 'package:mahindra_bricks/helper/network/network_api_services.dart';
import '../model/orderlist_model.dart';
import '../model/productdetail_model.dart';

class ProductdetailsRepo{

  final BaseApiServices _apiServices = NetworkApiServices();

  Future<ProductDetailModel> ProductdetailsApi() async {

    try {

      dynamic response = await _apiServices.getGetApiResponse(
        ApiConstants.productDetailsUrl,
      );

      return ProductDetailModel.fromJson(response);

    } catch (e) {

      if (kDebugMode) {
        print('Category API Error: $e');
      }

      rethrow;
    }
  }
}

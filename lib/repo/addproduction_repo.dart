import 'package:flutter/foundation.dart';
import 'package:mahindra_bricks/core/constant/api_constant.dart';
import 'package:mahindra_bricks/helper/network/base_api_services.dart';
import 'package:mahindra_bricks/helper/network/network_api_services.dart';
import 'package:mahindra_bricks/model/login_model.dart';

import '../model/addproduction_model.dart';
class AddproductionRepo{
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<AddproductionModel> addproductionApi(dynamic data) async {

    try {
      dynamic response =
      await _apiServices.getPostApiResponse(ApiConstants.addproductionUrl, data);
      return AddproductionModel.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during authApi: $e');
      }
      rethrow;
    }
  }
}
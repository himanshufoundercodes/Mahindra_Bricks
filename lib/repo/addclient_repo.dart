import 'package:flutter/foundation.dart';
import 'package:mahindra_bricks/core/constant/api_constant.dart';
import 'package:mahindra_bricks/helper/network/base_api_services.dart';
import 'package:mahindra_bricks/helper/network/network_api_services.dart';
import 'package:mahindra_bricks/model/login_model.dart';

import '../model/addclient_model.dart';
import '../model/addvehicle_model.dart';
class AddClientRepo{
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<AddClientModel> addClientApi(dynamic data) async {

    try {
      dynamic response =
      await _apiServices.getPostApiResponse(ApiConstants.addClientUrl, data);
      return AddClientModel.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during authApi: $e');
      }
      rethrow;
    }
  }
}
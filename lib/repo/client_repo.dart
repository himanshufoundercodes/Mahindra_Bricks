
import 'package:flutter/foundation.dart';
import 'package:mahindra_bricks/core/constant/api_constant.dart';
import 'package:mahindra_bricks/helper/network/base_api_services.dart';
import 'package:mahindra_bricks/helper/network/network_api_services.dart';
import '../model/clistlist_model.dart';

class ClientRepo {

  final BaseApiServices _apiServices = NetworkApiServices();

  Future<ClientListModel> clintApi() async {

    try {

      dynamic response = await _apiServices.getGetApiResponse(
        ApiConstants.clientListUrl,
      );

      return ClientListModel.fromJson(response);

    } catch (e) {

      if (kDebugMode) {
        print('Client API Error: $e');
      }

      rethrow;
    }
  }
}

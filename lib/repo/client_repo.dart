
import 'package:flutter/foundation.dart';
import 'package:mahindra_bricks/core/constant/api_constant.dart';
import 'package:mahindra_bricks/helper/network/base_api_services.dart';
import 'package:mahindra_bricks/helper/network/network_api_services.dart';
import '../model/category_model.dart';
import '../model/clistlist_model.dart';

class ClientRepo {

  final BaseApiServices _apiServices = NetworkApiServices();

  Future<List<ClientListModel>> clintApi() async {

    try {

      dynamic response = await _apiServices.getGetApiResponse(
        ApiConstants.clientListUrl,
      );

      List<ClientListModel> clientList = [];

      for (var item in response['data']) {
        clientList.add(ClientListModel.fromJson(item));
      }

      return clientList;

    } catch (e) {

      if (kDebugMode) {
        print('Category API Error: $e');
      }

      rethrow;
    }
  }
}

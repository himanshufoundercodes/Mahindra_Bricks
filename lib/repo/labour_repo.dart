
import 'package:flutter/foundation.dart';
import 'package:mahindra_bricks/core/constant/api_constant.dart';
import 'package:mahindra_bricks/helper/network/base_api_services.dart';
import 'package:mahindra_bricks/helper/network/network_api_services.dart';
import '../model/labour_model.dart';
import '../model/orderlist_model.dart';

class labourListRepo {

  final BaseApiServices _apiServices = NetworkApiServices();

  Future<List<LabourListModel>> LabourApi() async {

    try {

      dynamic response = await _apiServices.getGetApiResponse(
        ApiConstants.labourUrl,
      );

      List<LabourListModel> labourList = [];
      if (response is List) {
        labourList = response.map((e) => LabourListModel.fromJson(e as Map<String, dynamic>)).toList();
      } else if (response is Map && response['data'] is List) {
        labourList = (response['data'] as List).map((e) => LabourListModel.fromJson(e as Map<String, dynamic>)).toList();
      }

      return labourList;

    } catch (e) {

      if (kDebugMode) {
        print('Category API Error: $e');
      }

      rethrow;
    }
  }
}

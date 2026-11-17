// import 'package:mahindra_bricks/core/constant/api_constant.dart';
// import 'package:mahindra_bricks/helper/network/base_api_services.dart';
// import 'package:mahindra_bricks/helper/network/network_api_services.dart';
// import 'package:mahindra_bricks/model/dashboard_model.dart';
//
// class DashboardRepo {
//   final BaseApiServices _apiServices = NetworkApiServices();
//
//   Future<DashBoardListModel> DashBoardApi() async {
//
//     dynamic response = await _apiServices.getGetApiResponse(
//       ApiConstants.homeUrl,
//     );
//
//     return DashBoardListModel.fromJson(response['user']);
//   }
// }

import 'package:flutter/foundation.dart';
import 'package:mahindra_bricks/core/constant/api_constant.dart';
import 'package:mahindra_bricks/helper/network/network_api_services.dart';

class DashboardRepo {

  final NetworkApiServices _apiServices = NetworkApiServices();

  Future<Map<String, dynamic>> DashBoardApi() async {
    try {
      final response = await _apiServices.getGetApiResponse(
        ApiConstants.homeUrl,
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
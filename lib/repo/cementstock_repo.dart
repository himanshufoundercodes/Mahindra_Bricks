import 'package:mahindra_bricks/core/constant/api_constant.dart';
import 'package:mahindra_bricks/helper/network/base_api_services.dart';
import 'package:mahindra_bricks/helper/network/network_api_services.dart';

import '../model/cementstock_model.dart';

class CementStockRepo {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<CementStockModel> cementStockApi([dynamic date]) async {
    String url = ApiConstants.cementStockUrl;
    if (date != null) {
      String dateStr = '';
      if (date is DateTime) {
        dateStr = "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
      } else {
        dateStr = date.toString().trim();
      }
      if (dateStr.isNotEmpty) {
        url = '$url?date=$dateStr';
      }
    }

    dynamic response = await _apiServices.getGetApiResponse(url);

    return CementStockModel.fromJson(response);
  }
}
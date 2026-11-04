import 'package:mahindra_bricks/core/constant/api_constant.dart';
import 'package:mahindra_bricks/helper/network/base_api_services.dart';
import 'package:mahindra_bricks/helper/network/network_api_services.dart';

import '../model/cementstock_model.dart';

class CementStockRepo {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<CementStockModel> cementStockApi() async {
    dynamic response = await _apiServices.getGetApiResponse(
      ApiConstants.cementStockUrl,
    );

    return CementStockModel.fromJson(response);
  }
}
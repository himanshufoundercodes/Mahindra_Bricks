
import 'package:flutter/foundation.dart';
import 'package:mahindra_bricks/core/constant/api_constant.dart';
import 'package:mahindra_bricks/helper/network/base_api_services.dart';
import 'package:mahindra_bricks/helper/network/network_api_services.dart';
import '../model/stocklist_model.dart';

class StockListRepo {

  final BaseApiServices _apiServices = NetworkApiServices();

  Future<List<StocklistModel>> StockListApi() async {

    try {

      dynamic response = await _apiServices.getGetApiResponse(
        ApiConstants.stockUrl,
      );
      print("data${response}");

      List<StocklistModel> stockList = [];
      if (response is List) {
        stockList = response
            .map((e) => StocklistModel.fromJson(e as Map<String, dynamic>))
            .toList();
      } else if (response is Map && response['data'] is List) {
        stockList = (response['data'] as List)
            .map((e) => StocklistModel.fromJson(e as Map<String, dynamic>))
            .toList();
      }

      return stockList;
    } catch (e) {

      if (kDebugMode) {
        print('Stock API Error: $e');
      }
      rethrow;
    }
  }
}

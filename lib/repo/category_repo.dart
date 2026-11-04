
import 'package:flutter/foundation.dart';
import 'package:mahindra_bricks/core/constant/api_constant.dart';
import 'package:mahindra_bricks/helper/network/base_api_services.dart';
import 'package:mahindra_bricks/helper/network/network_api_services.dart';
import '../model/category_model.dart';

class CategoryRepo {

  final BaseApiServices _apiServices = NetworkApiServices();

  Future<List<CategoryModel>> categoryApi() async {

    try {

      dynamic response = await _apiServices.getGetApiResponse(
        ApiConstants.categoryUrl,
      );

      List<CategoryModel> categoryList = [];

      for (var item in response['data']) {
        categoryList.add(CategoryModel.fromJson(item));
      }

      return categoryList;

    } catch (e) {

      if (kDebugMode) {
        print('Category API Error: $e');
      }

      rethrow;
    }
  }
}

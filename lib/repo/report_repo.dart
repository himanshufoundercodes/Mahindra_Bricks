import 'package:flutter/foundation.dart';
import 'package:mahindra_bricks/core/constant/api_constant.dart';
import 'package:mahindra_bricks/helper/network/base_api_services.dart';
import 'package:mahindra_bricks/helper/network/network_api_services.dart';
import '../model/reportlist_model.dart';

class ReportsRepo {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<ReportListModel> ReportsApi({String? fromDate, String? toDate}) async {
    try {
      String url = ApiConstants.reportsUrl;
      List<String> queryParams = [];

      if (fromDate != null && fromDate.trim().isNotEmpty) {
        queryParams.add('from_date=${fromDate.trim()}');
      }
      if (toDate != null && toDate.trim().isNotEmpty) {
        queryParams.add('to_date=${toDate.trim()}');
      }

      if (queryParams.isNotEmpty) {
        url = '$url?${queryParams.join('&')}';
      }

      dynamic response = await _apiServices.getGetApiResponse(url);

      return ReportListModel.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print('Reports API Error: $e');
      }

      rethrow;
    }
  }
}

import 'package:flutter/foundation.dart';
import 'package:mahindra_bricks/core/constant/api_constant.dart';
import 'package:mahindra_bricks/helper/network/base_api_services.dart';
import 'package:mahindra_bricks/helper/network/network_api_services.dart';
import 'package:mahindra_bricks/model/attendence_model.dart';


class AttendenceRepo{
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<AttendanceDetailsModel> labourDetailApi(Map<String, dynamic> data) async {
    try {
      final id = data['id'];
      final fromDate = data['from_date'];
      final toDate = data['to_date'];

      String url = '${ApiConstants.labourAttendanceHistoryUrl}$id';
      if (fromDate != null && toDate != null) {
        url = '$url?from_date=$fromDate&to_date=$toDate';
      }

      dynamic response = await _apiServices.getGetApiResponse(url);

      return AttendanceDetailsModel.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print('AttendenceDetailApi Error: $e');
      }
      rethrow;
    }
  }
}

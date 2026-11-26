import 'package:mahindra_bricks/core/constant/api_constant.dart';
import 'package:mahindra_bricks/helper/network/network_api_services.dart';

class ReceivePaymentRepo {

  final NetworkApiServices _apiServices = NetworkApiServices();

  Future<dynamic> receivePaymentApi(
      String url,
      Map<String, dynamic> data,
      ) async {

    try {

      dynamic response = await _apiServices.getPostApiResponse(
        url,
        data,
      );

      return response;

    } catch (e) {
      rethrow;
    }
  }
}
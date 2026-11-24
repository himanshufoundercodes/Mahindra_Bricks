//
// import 'dart:io';
//
// import 'package:mahindra_bricks/core/constant/api_constant.dart';
// import 'package:mahindra_bricks/helper/network/network_api_services.dart';
//
//
//
// class ProductUpdateRepo {
//
//   final NetworkApiServices _apiServices =
//   NetworkApiServices();
//
//   Future<dynamic> updateProductApi(
//       String id,
//       Map<String, String> fields,
//       Map<String, File>? files,
//       ) async {
//
//     String url =
//         ApiConstants.baseUrl +
//             ApiConstants.updateProductUrl +
//             id;
//
//     dynamic response =
//     await _apiServices.putFormDataApiResponse(
//       url,
//       fields,
//       files,
//     );
//
//     return response;
//   }
// }

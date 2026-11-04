

import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mahindra_bricks/helper/app_exception.dart';
import 'package:mahindra_bricks/viewmodel/user_view_model.dart';

import 'base_api_services.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    final token = await UserViewModel().getToken();
    print("Bearer Token: $token");
    dynamic responseJson;
    try {
      final response =
      await http.get(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json; charset=UTF-8'
          },
          Uri.parse(url)).timeout(const Duration(seconds: 10));
      if (kDebugMode) {
        print('Api Url : $url');
      }
      responseJson = returnRequest(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    final token = await UserViewModel().getToken();

    dynamic responseJson;
    try {
      final response = await http.post(Uri.parse(url),
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(data)
        // )
        // .timeout(const Duration(seconds: 10)
      );
      if (kDebugMode) {
        print('Api Url : $url');
      }
      responseJson = returnRequest(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  dynamic returnRequest(response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
          debugPrint('response 200: $responseJson');
        return responseJson;

      case 201:
        dynamic responseJson = jsonDecode(response.body);
        debugPrint('response 201: $responseJson');
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
        throw UnauthorisedExceptions("Invalid username or password");
      case 404:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error accrued while communicating with server with status code${response.statusCode}');
    }
  }
}
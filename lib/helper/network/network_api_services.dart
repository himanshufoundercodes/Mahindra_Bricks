

import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mahindra_bricks/helper/app_exception.dart';
import 'package:mahindra_bricks/viewmodel/user_view_model.dart';

import 'base_api_services.dart';

class NetworkApiServices extends BaseApiServices {

  Map<String, String> _formHeaders() {
    return {
      "Cache-Control": "no-cache, no-store, must-revalidate",
      "Pragma": "no-cache",
      "Expires": "0",
    };
  }

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

  @override
  Future getPutApiResponse(String url, dynamic data) async {
    final token = await UserViewModel().getToken();

    dynamic responseJson;
    try {
      final response = await http.put(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data),
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

  @override
  Future getDeleteApiResponse(String url) async {
    final token = await UserViewModel().getToken();

    dynamic responseJson;

    try {
      final response = await http.delete(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (kDebugMode) {
        print('Delete Api Url : $url');
        print('Delete Status Code : ${response.statusCode}');
      }

      responseJson = returnRequest(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  Future<dynamic> putFormDataApiResponse(
      String url,
      Map<String, String> fields,
      Map<String, dynamic>? files,
      ) async {
    try {
      String? token = await UserViewModel().getToken();

      var request = http.MultipartRequest(
        'PUT',
        Uri.parse(url),
      );

      var headers = _formHeaders();
      headers['Accept'] = 'application/json';
      if (token != null && token.isNotEmpty) {
        headers['Authorization'] = 'Bearer $token';
      }
      request.headers.addAll(headers);
      request.fields.addAll(fields);

      if (files != null) {
        await _addFilesToRequest(request, files);
      }

      var streamed = await request.send();
      var response = await http.Response.fromStream(streamed);

      return returnRequest(response);
    } catch (e) {
      if (kDebugMode) print("PUT FormData Error: $e");
      rethrow;
    }
  }

  @override
  Future getPostApiFormData(
      String url, Map<String, String> fields, Map<String, dynamic> files) async {
    final token = await UserViewModel().getToken();
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      var headers = _formHeaders();
      if (token != null && token.isNotEmpty) {
        headers['Authorization'] = 'Bearer $token';
      }
      request.headers.addAll(headers);
      request.fields.addAll(fields);

      await _addFilesToRequest(request, files);

      var streamed = await request.send();
      var response = await http.Response.fromStream(streamed);

      return returnRequest(response);

    } catch (e) {
      if (kDebugMode) print("POST FormData Error: $e");
      rethrow;
    }
  }

  Future<void> _addFilesToRequest(
      http.MultipartRequest request, Map<String, dynamic> files) async {
    for (var entry in files.entries) {
      final key = entry.key;
      final value = entry.value;

      // 1️⃣ Single file
      if (value is File) {
        request.files.add(
          await http.MultipartFile.fromPath(key, value.path),
        );
      }

      // 2️⃣ Multiple files  → SAME KEY again & again
      else if (value is List<File>) {
        for (File f in value) {
          request.files.add(
            await http.MultipartFile.fromPath(key, f.path),
          );
        }
      }
    }
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
        String message = response.body.toString();
        try {
          var decoded = jsonDecode(response.body);
          if (decoded is Map && decoded.containsKey('message')) {
            message = decoded['message'];
          }
        } catch (e) {
        }
        throw BadRequestException(message);
      case 401:
        throw UnauthorisedExceptions("Invalid username or password");
      case 404:
        throw UnauthorisedException(response.body.toString());
      case 409:
        String message = response.body.toString();
        try {
          var decoded = jsonDecode(response.body);
          if (decoded is Map && decoded.containsKey('message')) {
            message = decoded['message'];
          }
        } catch (e) {}
        throw BadRequestException(message);
      case 500:
      default:
        throw FetchDataException(
            'Error accrued while communicating with server with status code${response.statusCode}');
    }
  }
}
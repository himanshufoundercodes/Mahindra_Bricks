import 'package:flutter/foundation.dart';
import 'package:mahindra_bricks/core/constant/api_constant.dart';
import 'package:mahindra_bricks/helper/network/base_api_services.dart';
import 'package:mahindra_bricks/helper/network/network_api_services.dart';
import 'package:mahindra_bricks/model/profile_model.dart';


class ProfileRepo {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<ProfileModel> profileApi() async {

    dynamic response = await _apiServices.getGetApiResponse(
      ApiConstants.profileUrl,
    );

    return ProfileModel.fromJson(response['user']);
  }
}
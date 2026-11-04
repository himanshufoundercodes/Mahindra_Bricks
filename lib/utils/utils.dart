
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mahindra_bricks/Constant/Constant_Color.dart';

class Utils {

  static void showSuccessMessage(
      BuildContext context, String message) {

    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      backgroundColor: AppColor.stockUnitColor,
      textColor: Colors.white,
      fontSize: 14,
    );
  }

  static void showErrorMessage(
      BuildContext context, String message) {

    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      backgroundColor: AppColor.red2,
      textColor: Colors.white,
      fontSize: 12,
    );
  }
}

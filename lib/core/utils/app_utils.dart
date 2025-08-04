import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nextbestie_admin/core/constants/app_colors.dart';

class AppUtils {
  static snackbar({
    required String title,
    required String message,
    bool isError = false,
  }) async {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      backgroundColor: isError ? Colors.redAccent : AppColors.white,
      textColor: isError ? AppColors.white : AppColors.black,
      fontSize: 16.0,
    );
  }
}

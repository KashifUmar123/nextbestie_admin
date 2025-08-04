import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nextbestie_admin/core/base/admin_controller.dart';
import 'package:nextbestie_admin/core/base/base_controller.dart';
import 'package:nextbestie_admin/core/pages/route_names.dart';
import 'package:nextbestie_admin/core/utils/app_utils.dart';

class LoginScreenController extends BaseController {
  LoginScreenController(super.iNavigator);

  late TextEditingController emailController;
  late TextEditingController passwordController;

  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController(text: "admin@gmail.com");
    passwordController = TextEditingController(text: "Admin@123");
  }

  Future<void> onLogin() async {
    bool isValid = formKey.currentState?.validate() ?? false;
    if (!isValid) return;

    debugPrint("EMAIL: ${emailController.text.trim()}");
    debugPrint("PASSWORD: ${passwordController.text.trim()}");

    if (emailController.text.trim() == "admin@gmail.com" &&
        passwordController.text.trim() == "Admin@123") {
      await Get.find<AdminController>().login();
      iNavigator.pushReplacementNamed(RouteNames.home);
    } else {
      AppUtils.snackbar(
        title: "Error",
        message: "Invalid email or password",
        isError: true,
      );
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
  }
}

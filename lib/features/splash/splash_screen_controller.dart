import 'dart:developer';

import 'package:get/get.dart';
import 'package:nextbestie_admin/core/base/base_controller.dart';
import 'package:nextbestie_admin/core/pages/route_names.dart';
import 'package:nextbestie_admin/core/services/local_storage_service.dart';

class SplashScreenController extends BaseController {
  SplashScreenController(super.iNavigator);

  @override
  void onInit() {
    super.onInit();
    _navigate();
  }

  void _navigate() async {
    await Future.delayed(const Duration(milliseconds: 100));
    final isLoggedIn = Get.find<LocalStorageService>().read<bool>(
          StorageConstants.isLoggedIn,
        ) ??
        false;
    log("IS LOGGED IN: $isLoggedIn");
    if (isLoggedIn) {
      iNavigator.pushReplacementNamed(RouteNames.home);
    } else {
      iNavigator.pushReplacementNamed(RouteNames.login);
    }
  }
}

import 'package:get/get.dart';
import 'package:nextbestie_admin/core/base/base_controller.dart';
import 'package:nextbestie_admin/core/pages/route_names.dart';
import 'package:nextbestie_admin/core/services/secure_storage_service.dart';

class SplashScreenController extends BaseController {
  SplashScreenController(super.iNavigator);

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(milliseconds: 100), () {
      _navigate();
    });
  }

  void _navigate() async {
    final isLoggedIn = await Get.find<SecureStorageService>().getLoggedIn();

    if (isLoggedIn) {
      iNavigator.pushReplacementNamed(RouteNames.home);
    } else {
      iNavigator.pushReplacementNamed(RouteNames.login);
    }
  }
}

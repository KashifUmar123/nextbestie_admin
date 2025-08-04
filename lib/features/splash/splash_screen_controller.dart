import 'package:nextbestie_admin/core/base/base_controller.dart';
import 'package:nextbestie_admin/core/pages/route_names.dart';

class SplashScreenController extends BaseController {
  SplashScreenController(super.iNavigator);

  @override
  void onInit() {
    super.onInit();
    _navigate();
  }

  void _navigate() {
    Future.delayed(const Duration(seconds: 2), () {
      iNavigator.pushReplacementNamed(RouteNames.home);
    });
  }
}

import 'package:get/get.dart';
import 'package:nextbestie_admin/features/splash/splash_screen_controller.dart';

class SplashScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashScreenController(Get.find()));
  }
}

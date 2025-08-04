import 'package:get/get.dart';
import 'package:nextbestie_admin/features/login/login_screen_controller.dart';

class LoginScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginScreenController(Get.find()));
  }
}

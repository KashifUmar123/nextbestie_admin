import 'package:get/get.dart';
import 'package:nextbestie_admin/features/home/home_screen_controller.dart';

class HomeScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeScreenController(Get.find()));
  }
}

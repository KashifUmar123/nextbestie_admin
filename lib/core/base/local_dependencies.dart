import 'package:get/get.dart';
import 'package:nextbestie_admin/core/pages/i_navigator.dart';

class LocalDependencies {
  static Future<void> init() async {
    Get.put<INavigator>(NavigatorImpl(), permanent: true);
  }
}

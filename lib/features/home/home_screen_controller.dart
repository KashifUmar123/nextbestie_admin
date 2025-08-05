import 'package:get/get.dart';
import 'package:nextbestie_admin/core/base/admin_controller.dart';
import 'package:nextbestie_admin/core/base/base_controller.dart';
import 'package:nextbestie_admin/core/pages/route_names.dart';

class HomeScreenController extends BaseController {
  HomeScreenController(super.iNavigator);

  int index = 0;

  void onLogout() async {
    await Get.find<AdminController>().logout();
    iNavigator.pushReplacementNamed(RouteNames.login);
  }

  void onSidebarItemTap(int index, String route) {
    this.index = index;
    navigateToRoute(route);
    update();
  }

  void navigateToRoute(String route) {
    // Use go() for nested route navigation to prevent hot reloads
    iNavigator.offAndPushNamed(route);
  }
}

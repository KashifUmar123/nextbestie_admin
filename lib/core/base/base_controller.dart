import 'package:get/get.dart';
import 'package:nextbestie_admin/core/pages/i_navigator.dart';

abstract class BaseController extends GetxController {
  INavigator iNavigator;
  BaseController(this.iNavigator);
}

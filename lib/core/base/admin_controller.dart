import 'dart:developer';
import 'package:get/get.dart';
import 'package:nextbestie_admin/core/base/base_controller.dart';
import 'package:nextbestie_admin/core/services/local_storage_service.dart';

class AdminController extends BaseController {
  AdminController(super.iNavigator);

  bool isAdminLoggedIn = false;

  @override
  void onInit() {
    super.onInit();
    _initAdminAuth();
  }

  void _initAdminAuth() async {
    isAdminLoggedIn = Get.find<LocalStorageService>().read<bool>(
          StorageConstants.isLoggedIn,
        ) ??
        false;
    update();
    log("IS ADMIN LOGGED IN: $isAdminLoggedIn");
  }

  void _setAdminLoggedIn({bool value = true}) {
    isAdminLoggedIn = value;
    update();
  }

  Future<void> login() async {
    await Get.find<LocalStorageService>().write<bool>(
      StorageConstants.isLoggedIn,
      true,
    );
    _setAdminLoggedIn(value: true);
  }

  Future<void> logout() async {
    await Get.find<LocalStorageService>().write<bool>(
      StorageConstants.isLoggedIn,
      false,
    );
    _setAdminLoggedIn(value: false);
  }
}

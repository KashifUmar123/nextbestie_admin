import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nextbestie_admin/core/base/admin_controller.dart';
import 'package:nextbestie_admin/core/pages/app_router.dart';
import 'package:nextbestie_admin/core/pages/i_navigator.dart';
import 'package:nextbestie_admin/core/services/local_storage_service.dart';
import 'package:nextbestie_admin/core/services/secure_storage_service.dart';

class LocalDependencies {
  static Future<void> init() async {
    // Initialize GoRouter navigator
    final navigator = NavigatorImpl(AppRouter.router);
    Get.put<INavigator>(navigator, permanent: true);

    try {
      final LocalStorageService storageService = LocalStorageService();
      await storageService.init();
      Get.put<LocalStorageService>(storageService, permanent: true);
    } catch (e) {
      debugPrint('[FAILED] to initialize local dependencies: $e');
    }

    try {
      final SecureStorageService secureStorageService = SecureStorageService();
      Get.put<SecureStorageService>(secureStorageService, permanent: true);
    } catch (e) {
      debugPrint('[FAILED] to initialize secure storage service: $e');
    }

    try {
      final AdminController adminController = AdminController(
        Get.find<INavigator>(),
      );
      Get.put<AdminController>(adminController, permanent: true);
    } catch (e) {
      debugPrint('[FAILED] to initialize admin controller: $e');
    }
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nextbestie_admin/core/constants/app_assets.dart';
import 'package:nextbestie_admin/core/widgets/custom_image.dart';
import 'package:nextbestie_admin/core/widgets/custom_scaffold.dart';
import 'package:nextbestie_admin/features/splash/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: GetBuilder(
        init: controller,
        builder: (_) {
          return SizedBox(
            height: Get.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                CustomImage(
                  imageUrl: AppAssets.logo,
                  width: 150,
                  height: 150,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

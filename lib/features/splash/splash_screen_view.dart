import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nextbestie_admin/core/extension/fonts_extension.dart';
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
          return Column(
            children: [
              Text(
                "HEllo Admim",
                style: context.label30500,
              ),
            ],
          );
        },
      ),
    );
  }
}

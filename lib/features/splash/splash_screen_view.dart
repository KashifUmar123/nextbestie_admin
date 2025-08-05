import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nextbestie_admin/core/constants/app_assets.dart';
import 'package:nextbestie_admin/core/pages/i_navigator.dart';
import 'package:nextbestie_admin/core/widgets/custom_image.dart';
import 'package:nextbestie_admin/core/widgets/custom_scaffold.dart';
import 'package:nextbestie_admin/features/splash/splash_screen_controller.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  late SplashScreenController _controller;

  @override
  void initState() {
    super.initState();
    _controller = SplashScreenController(Get.find<INavigator>());
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: GetBuilder<SplashScreenController>(
        init: _controller,
        builder: (controller) {
          return SizedBox(
            height: MediaQuery.of(context).size.height,
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

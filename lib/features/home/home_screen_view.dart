import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nextbestie_admin/core/extension/fonts_extension.dart';
import 'package:nextbestie_admin/core/widgets/custom_button.dart';
import 'package:nextbestie_admin/core/widgets/custom_scaffold.dart';
import 'package:nextbestie_admin/features/home/home_screen_controller.dart';

class HomeScreenView extends GetView<HomeScreenController> {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: GetBuilder(
        init: controller,
        builder: (_) {
          return Column(
            children: [
              Center(
                child: Text(
                  "Home",
                  style: context.label30500,
                ),
              ),
              CustomButton(
                text: "Logout",
                onTap: controller.onLogout,
              ),
            ],
          );
        },
      ),
    );
  }
}

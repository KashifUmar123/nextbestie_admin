import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nextbestie_admin/core/constants/app_assets.dart';
import 'package:nextbestie_admin/core/constants/app_colors.dart';
import 'package:nextbestie_admin/core/extension/fonts_extension.dart';
import 'package:nextbestie_admin/core/extension/num_extension.dart';
import 'package:nextbestie_admin/core/utils/dimension.dart';
import 'package:nextbestie_admin/core/widgets/custom_button.dart';
import 'package:nextbestie_admin/core/widgets/custom_image.dart';
import 'package:nextbestie_admin/core/widgets/custom_scaffold.dart';
import 'package:nextbestie_admin/core/widgets/custom_textfield.dart';
import 'package:nextbestie_admin/features/login/login_screen_controller.dart';

class LoginScreenView extends GetView<LoginScreenController> {
  const LoginScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: GetBuilder(
        init: controller,
        builder: (_) {
          return Column(
            children: [
              100.verticalSpace,
              CustomImage(
                imageUrl: AppAssets.logo,
                height: 120,
                width: 120,
              ),
              50.verticalSpace,
              Container(
                padding: EdgeInsets.all(30),
                decoration: ShapeDecoration(
                  shape: SmoothRectangleBorder(
                    borderRadius: kRadiusAll(15, cornerSmoothing: 1),
                  ),
                  color: AppColors.white,
                  shadows: [
                    BoxShadow(
                      color: AppColors.black.withValues(alpha: .2),
                      blurRadius: 10,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      Text(
                        "Welcome back",
                        style: context.label20500,
                      ),
                      20.verticalSpace,
                      CustomTextField(
                        controller: controller.emailController,
                        hintText: "Enter email",
                        labelText: "Email",
                        prefix: Icon(Icons.email_outlined),
                        validator: (p0) {
                          if (p0 == null || p0.isEmpty) {
                            return "Email is required";
                          }
                          return null;
                        },
                      ),
                      20.verticalSpace,
                      CustomTextField(
                        controller: controller.passwordController,
                        hintText: "Enter password",
                        labelText: "Password",
                        isPassword: true,
                        prefix: Icon(Icons.lock_outline),
                        validator: (p0) {
                          if (p0 == null || p0.isEmpty) {
                            return "Password is required";
                          }
                          return null;
                        },
                      ),
                      20.verticalSpace,
                      CustomButton(
                        text: "Login",
                        onTap: controller.onLogin,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:nextbestie_admin/core/constants/app_assets.dart';
import 'package:nextbestie_admin/core/constants/app_colors.dart';
import 'package:nextbestie_admin/core/extension/fonts_extension.dart';
import 'package:nextbestie_admin/core/extension/num_extension.dart';
import 'package:nextbestie_admin/core/utils/dimension.dart';
import 'package:nextbestie_admin/core/widgets/custom_button.dart';
import 'package:nextbestie_admin/core/widgets/custom_image.dart';
import 'package:nextbestie_admin/core/widgets/custom_scaffold.dart';
import 'package:nextbestie_admin/core/widgets/custom_textfield.dart';

class LoginScreenView extends StatelessWidget {
  const LoginScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
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
            child: Column(
              children: [
                Text(
                  "Welcome back",
                  style: context.label20500,
                ),
                20.verticalSpace,
                CustomTextField(
                  hintText: "Enter email",
                  labelText: "Email",
                  prefix: Icon(Icons.email_outlined),
                ),
                20.verticalSpace,
                CustomTextField(
                  hintText: "Enter password",
                  labelText: "Password",
                  isPassword: true,
                  prefix: Icon(Icons.lock_outline),
                ),
                20.verticalSpace,
                CustomButton(
                  text: "Login",
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nextbestie_admin/core/constants/app_colors.dart';
import 'package:nextbestie_admin/core/extension/fonts_extension.dart';
import 'package:nextbestie_admin/core/extension/num_extension.dart';
import 'package:nextbestie_admin/core/pages/i_navigator.dart';
import 'package:nextbestie_admin/core/widgets/custom_button.dart';
import 'package:nextbestie_admin/features/articles/articles_screen_controller.dart';

class ArticlesScreenView extends StatelessWidget {
  const ArticlesScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ArticlesScreenController(Get.find<INavigator>()),
      builder: (controller) {
        return Column(
          children: [
            10.verticalSpace,
            _buildHeader(context),
            10.verticalSpace,
          ],
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Text(
          "Articles",
          style: context.label20500,
        ),
        const Spacer(),
        CustomButton(
          text: "Add Article",
          onTap: () {},
          width: 120,
          height: 30,
          textStyle: context.label12400.copyWith(color: AppColors.white),
        ),
      ],
    );
  }
}

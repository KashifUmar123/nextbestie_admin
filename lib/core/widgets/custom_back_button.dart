import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nextbestie_admin/core/constants/app_colors.dart';
import 'package:nextbestie_admin/core/pages/i_navigator.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
    this.onTap,
    this.bgColor,
  });

  final VoidCallback? onTap;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? Get.find<INavigator>().pop,
      child: Container(
        height: 38,
        width: 38,
        decoration: BoxDecoration(
          color: bgColor ?? AppColors.backIconBg,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.textColor,
            size: 18,
          ),
        ),
      ),
    );
  }
}

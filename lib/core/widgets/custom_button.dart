import 'package:flutter/material.dart';
import 'package:nextbestie_admin/core/constants/app_colors.dart';
import 'package:nextbestie_admin/core/extension/fonts_extension.dart';
import 'package:nextbestie_admin/core/extension/num_extension.dart';
import 'package:nextbestie_admin/core/utils/dimension.dart';
import 'package:nextbestie_admin/core/widgets/custom_animated_switcher.dart';
import 'package:nextbestie_admin/core/widgets/custom_image.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.onTap,
    this.isPrimary = true,
    this.textStyle,
    this.backgroundColor,
    this.isLoading = false,
    this.icon,
    this.isDiabled = false,
    this.height,
    this.width,
    this.loadingWidget,
    this.secondaryBgColor,
    this.hasBorder = true,
    this.borderRadius,
    this.borderColor,
  });

  final String text;
  final VoidCallback? onTap;
  final bool isPrimary;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final bool isLoading;
  final String? icon;
  final bool isDiabled;
  final double? height;
  final double? width;
  final Widget? loadingWidget;
  final Color? secondaryBgColor;
  final bool hasBorder;
  final double? borderRadius;
  final Color? borderColor;

  Color getSplashColor(BuildContext context) {
    if (isDiabled) {
      return Colors.transparent;
    } else {
      return AppColors.pink.withValues(alpha: 0.3);
    }
  }

  Color getHighlightColor(BuildContext context) {
    if (isDiabled) {
      return Colors.transparent;
    } else {
      return AppColors.pink.withValues(alpha: 0.1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isDiabled ? null : onTap,
      child: Container(
        height: height ?? 55,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
            boxShadow: isPrimary
                ? [
                    BoxShadow(
                      color: AppColors.textColor.withValues(
                        alpha: .1,
                      ),
                      offset: const Offset(0, 4),
                      blurRadius: 10,
                      spreadRadius: 5,
                    ),
                  ]
                : null,
            color: backgroundColor ?? _backgroundColor(context),
            borderRadius: kRadiusAll(
              borderRadius ?? ((height ?? 55) / 2),
              cornerSmoothing: 1.0,
            ),
            border: hasBorder
                ? Border.all(
                    color: isPrimary
                        ? AppColors.background
                        : borderColor ?? AppColors.pink,
                    width: 1,
                  )
                : null),
        child: Center(
          child: CustomAnimatedSwitcher(
            child: _renderContent(context),
          ),
        ),
      ),
    );
  }

  Color? _backgroundColor(BuildContext context) {
    if (isDiabled) {
      if (isPrimary) {
        return AppColors.pink.withValues(alpha: .6);
      } else {
        return secondaryBgColor ?? AppColors.background;
      }
    } else {
      if (isPrimary) {
        return AppColors.pink;
      } else {
        return secondaryBgColor ?? AppColors.background;
      }
    }
  }

  Widget _renderContent(BuildContext context) {
    if (isLoading) {
      return SizedBox(
        height: height != null ? (height! - 10) : 25,
        width: height != null ? (height! - 10) : 25,
        child: CircularProgressIndicator(
          color: isPrimary ? AppColors.white : AppColors.pink,
          strokeWidth: 1,
        ),
      );
    } else {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            CustomImage(
              imageUrl: icon ?? "",
              height: 22,
              width: 22,
            ),
            8.horizontalSpace,
          ],
          Text(
            text,
            style: textStyle ??
                context.label16500.copyWith(
                  color: isPrimary ? AppColors.white : AppColors.pink,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ],
      );
    }
  }
}

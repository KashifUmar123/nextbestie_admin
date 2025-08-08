import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:nextbestie_admin/core/constants/app_colors.dart';
import 'package:nextbestie_admin/core/extension/fonts_extension.dart';
import 'package:nextbestie_admin/core/extension/num_extension.dart';
import 'package:nextbestie_admin/core/utils/dimension.dart';
import 'package:nextbestie_admin/core/widgets/custom_button.dart';

class CustomDialogueBox extends StatelessWidget {
  const CustomDialogueBox(
      {super.key,
      required this.title,
      required this.description,
      required this.leftButton,
      required this.rightButton});
  final String title;
  final String description;
  final String leftButton;
  final String rightButton;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: kRadiusAll(25),
      ),
      child: Container(
        padding: EdgeInsets.all(50),
        width: 540,
        height: 330,
        decoration: ShapeDecoration(
          shape: SmoothRectangleBorder(
            borderRadius: kRadiusAll(25),
            side: BorderSide(color: AppColors.pink),
          ),
          color: AppColors.background,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: context.label16700.copyWith(
                fontSize: 28,
              ),
            ),
            35.verticalSpace,
            Text(
              description,
              style: context.label14400.copyWith(
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            40.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    CustomButton(
                      text: leftButton,
                      backgroundColor: AppColors.pink,
                      hasBorder: false,
                      width: 84,
                      height: 40,
                      isPrimary: false,
                      textStyle: context.label16500.copyWith(
                        color: AppColors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    10.horizontalSpace,
                    CustomButton(
                      text: rightButton,
                      backgroundColor: AppColors.buttonGreyColor,
                      hasBorder: false,
                      isPrimary: false,
                      width: 84,
                      height: 40,
                      textStyle: context.label16500.copyWith(
                        color: AppColors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

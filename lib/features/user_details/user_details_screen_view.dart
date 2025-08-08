import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nextbestie_admin/core/constants/app_assets.dart';
import 'package:nextbestie_admin/core/constants/app_colors.dart';
import 'package:nextbestie_admin/core/extension/fonts_extension.dart';
import 'package:nextbestie_admin/core/extension/num_extension.dart';
import 'package:nextbestie_admin/core/pages/i_navigator.dart';
import 'package:nextbestie_admin/core/widgets/custom_button.dart';
import 'package:nextbestie_admin/features/user_details/user_details_screen_controller.dart';

class UserDetailsScreenView extends StatelessWidget {
  const UserDetailsScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: UserDetailsScreenController(
        Get.find<INavigator>(),
      ),
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _header(context),
            32.verticalSpace,
            _profileDetails(context),
            28.verticalSpace,
            _actionButtonsRow(context, controller),
            18.verticalSpace,
            Text(
              'Report Details',
              style: context.label16600.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            14.verticalSpace,
            _reportDescription(context)
          ],
        );
      },
    );
  }

  Text _header(BuildContext context) {
    return Text(
      'User Details',
      style: context.label16700.copyWith(
        fontSize: 32,
      ),
    );
  }

  Row _profileDetails(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 128,
          height: 128,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(AppAssets.dummyProfilePic),
            ),
          ),
        ),
        16.horizontalSpace,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ethan Hunt',
              style: context.label16700.copyWith(
                fontSize: 22,
              ),
            ),
            8.verticalSpace,
            Text(
              'ethanhunt@gmail.com',
              style: context.label16400.copyWith(color: AppColors.emailColor),
            )
          ],
        ),
      ],
    );
  }

  Row _actionButtonsRow(
      BuildContext context, UserDetailsScreenController controller) {
    return Row(
      children: [
        CustomButton(
          text: 'Ignore',
          backgroundColor: AppColors.buttonGreyColor,
          hasBorder: false,
          width: 84,
          height: 40,
          isPrimary: false,
          textStyle: context.label16500.copyWith(
            color: AppColors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        10.horizontalSpace,
        CustomButton(
          onTap: () => controller.blockUserDialogue(context),
          text: 'Block',
          backgroundColor: AppColors.pink,
          hasBorder: false,
          isPrimary: false,
          width: 84,
          height: 40,
          textStyle: context.label16500.copyWith(
            color: AppColors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Container _reportDescription(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      constraints: BoxConstraints(
        minHeight: 100,
        // maxHeight: 500,
      ),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(
            color: AppColors.borderGreyColor.withAlpha(50),
          ),
        ),
      ),
      child: Text(
        '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.''',
        style: context.label14400.copyWith(color: AppColors.borderGreyColor),
      ),
    );
  }
}

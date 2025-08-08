import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nextbestie_admin/core/constants/app_colors.dart';
import 'package:nextbestie_admin/core/extension/fonts_extension.dart';
import 'package:nextbestie_admin/core/extension/num_extension.dart';
import 'package:nextbestie_admin/core/pages/i_navigator.dart';
import 'package:nextbestie_admin/core/utils/dimension.dart';
import 'package:nextbestie_admin/features/blocked_users/blocked_screen_controller.dart';

class BlockedScreenView extends StatelessWidget {
  const BlockedScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: BlockedScreenController(Get.find<INavigator>()),
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.verticalSpace,
            _buildHeader(context, controller),
            20.verticalSpace,
            Expanded(
              child: _buildBlockedUsersTable(context, controller),
            ),
            50.verticalSpace,
          ],
        );
      },
    );
  }

  Widget _buildHeader(
      BuildContext context, BlockedScreenController controller) {
    return Text(
      "Blocked Users",
      style: context.label20500.copyWith(
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildBlockedUsersTable(
      BuildContext context, BlockedScreenController controller) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: kRadiusAll(12),
      ),
      child: Column(
        children: [
          // Table Header
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.black.withValues(alpha: 0.2),
                  width: 1,
                ),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    "User",
                    style: context.label14400.copyWith(
                      color: AppColors.articleTextColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "Action",
                    style: context.label14400.copyWith(
                      color: AppColors.articleTextColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              controller: controller.scrollController,
              itemCount: controller.blockedUsers.length +
                  (controller.isLoadingMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == controller.blockedUsers.length) {
                  // Loading indicator for pagination
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(AppColors.pink),
                      ),
                    ),
                  );
                }

                final blockedUser = controller.blockedUsers[index];
                return Column(
                  children: [
                    _buildArticleRow(
                      context,
                      blockedUser.name,
                      unblockUser: () {
                        controller.unblockUserDialogue(context);
                      },
                    ),
                    if (index < controller.blockedUsers.length - 1)
                      _buildDivider(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildArticleRow(
    BuildContext context,
    String title, {
    VoidCallback? unblockUser,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              title,
              style: context.label14400.copyWith(
                color: AppColors.articleTextColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: unblockUser,
              child: Text(
                "Unblock",
                style: context.label14400.copyWith(
                  color: AppColors.pink,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 1,
      color: Colors.grey.withValues(alpha: 0.2),
      margin: EdgeInsets.symmetric(horizontal: 24),
    );
  }
}

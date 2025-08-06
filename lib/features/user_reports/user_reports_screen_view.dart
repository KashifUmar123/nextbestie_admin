import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nextbestie_admin/core/constants/app_colors.dart';
import 'package:nextbestie_admin/core/extension/fonts_extension.dart';
import 'package:nextbestie_admin/core/extension/num_extension.dart';
import 'package:nextbestie_admin/core/pages/i_navigator.dart';
import 'package:nextbestie_admin/core/utils/dimension.dart';
import 'package:nextbestie_admin/features/user_reports/user_reports_screen_controller.dart';

class UserReportsScreenView extends StatelessWidget {
  const UserReportsScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: UserReportsScreenController(Get.find<INavigator>()),
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.verticalSpace,
              _buildHeader(context, controller),
              20.verticalSpace,
              Expanded(
                child: _buildUserReportsTable(context, controller),
              ),
              50.verticalSpace,
            ],
          );
        });
  }

  Widget _buildHeader(
      BuildContext context, UserReportsScreenController controller) {
    return Text(
      "User Reports",
      style: context.label20500.copyWith(
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildUserReportsTable(
      BuildContext context, UserReportsScreenController controller) {
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
                  flex: 3,
                  child: Text(
                    "Reason",
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
              itemCount: controller.userReports.length +
                  (controller.isLoadingMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == controller.userReports.length) {
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

                final userReport = controller.userReports[index];
                return Column(
                  children: [
                    _buildArticleRow(
                      context,
                      userReport.userName,
                      userReport.reportData,
                      onEdit: () => {},
                      onDelete: () => {},
                    ),
                    if (index < controller.userReports.length - 1)
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
    String title,
    String description, {
    VoidCallback? onEdit,
    VoidCallback? onDelete,
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
            flex: 3,
            child: Text(
              description,
              style: context.label14400.copyWith(
                color: Colors.grey[600],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: _buildActionButton(
              icon: Icons.arrow_forward_ios,
              onTap: onEdit ?? () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.black.withValues(alpha: 0.2),
            width: 1,
          ),
        ),
        child: Icon(
          icon,
          size: 16,
          color: Colors.black.withValues(alpha: 0.7),
        ),
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

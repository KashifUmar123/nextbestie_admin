import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nextbestie_admin/core/constants/app_colors.dart';
import 'package:nextbestie_admin/core/extension/fonts_extension.dart';
import 'package:nextbestie_admin/core/extension/num_extension.dart';
import 'package:nextbestie_admin/core/pages/i_navigator.dart';
import 'package:nextbestie_admin/core/utils/dimension.dart';
import 'package:nextbestie_admin/core/widgets/custom_button.dart';
import 'package:nextbestie_admin/features/categories/categories_screen_controller.dart';

class CategoriesScreenView extends GetView<CategoriesScreenController> {
  const CategoriesScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CategoriesScreenController(Get.find<INavigator>()),
      builder: (controller) {
        return Column(
          children: [
            20.verticalSpace,
            _buildHeader(context, controller),
            20.verticalSpace,
            Expanded(
              child: _buildCategoriesTable(context, controller),
            ),
            50.verticalSpace,
          ],
        );
      },
    );
  }

  Widget _buildHeader(
      BuildContext context, CategoriesScreenController controller) {
    return Row(
      children: [
        15.horizontalSpace,
        Text(
          "Categories",
          style: context.label20500.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacer(),
        CustomButton(
          onTap: () => controller.onAddNewCategory(context),
          text: "Create new category",
          // onTap: controller.onAddNewArticle,
          backgroundColor: AppColors.pink,
          textStyle: context.label14400.copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.w500,
          ),
          width: 180,
          height: 40,
        ),
      ],
    );
  }

  Widget _buildCategoriesTable(
      BuildContext context, CategoriesScreenController controller) {
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
                    "Title",
                    style: context.label14400.copyWith(
                      color: AppColors.articleTextColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    "Description",
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
              itemCount: controller.categories.length +
                  (controller.isLoadingMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == controller.categories.length) {
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

                final category = controller.categories[index];
                return Column(
                  children: [
                    _buildArticleRow(
                      context,
                      category.title,
                      category.description!,
                      onEdit: () => {},
                      onDelete: () => {},
                    ),
                    if (index < controller.categories.length - 1)
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
            flex: 2,
            child: Text(
              description,
              style: context.label14400.copyWith(
                color: Colors.grey[600],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                _buildActionButton(
                  icon: Icons.edit,
                  onTap: onEdit ?? () {},
                ),
                8.horizontalSpace,
                _buildActionButton(
                  icon: Icons.delete,
                  onTap: onDelete ?? () {},
                ),
              ],
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

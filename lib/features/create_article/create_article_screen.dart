import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nextbestie_admin/core/constants/app_colors.dart';
import 'package:nextbestie_admin/core/extension/fonts_extension.dart';
import 'package:nextbestie_admin/core/extension/num_extension.dart';
import 'package:nextbestie_admin/core/pages/i_navigator.dart';
import 'package:nextbestie_admin/core/utils/dimension.dart';
import 'package:nextbestie_admin/core/widgets/custom_button.dart';
import 'package:nextbestie_admin/core/widgets/custom_image_picker.dart';
import 'package:nextbestie_admin/core/widgets/custom_textfield.dart';
import 'package:nextbestie_admin/features/create_article/create_article_controller.dart';

class CreateArticleScreen extends StatelessWidget {
  const CreateArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CreateArticleController(Get.find<INavigator>()),
      builder: (controller) {
        return SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              32.verticalSpace,
              _buildTitleSection(context, controller),
              24.verticalSpace,
              _buildDescriptionSection(context, controller),
              24.verticalSpace,
              _buildImageSection(context, controller),
              32.verticalSpace,
              _buildActionButtons(context, controller),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Text(
      "Create new article",
      style: context.label20500.copyWith(
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildTitleSection(
      BuildContext context, CreateArticleController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Title",
          style: context.label14400.copyWith(
            color: AppColors.articleTextColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        8.verticalSpace,
        CustomTextField(
          controller: controller.titleController,
          hintText: "Enter article title",
          borderRadius: kRadiusAll(8),
          prefix: Icon(Icons.title),
        ),
      ],
    );
  }

  Widget _buildDescriptionSection(
      BuildContext context, CreateArticleController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Description",
          style: context.label14400.copyWith(
            color: AppColors.articleTextColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        8.verticalSpace,
        CustomTextField(
          hintText: "Type here...",
          prefix: Icon(Icons.description),
          minLines: 4,
          maxLines: 6,
          width: double.infinity,
          borderRadius: kRadiusAll(12),
        )
      ],
    );
  }

  Widget _buildImageSection(
      BuildContext context, CreateArticleController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Article Images",
          style: context.label14400.copyWith(
            color: AppColors.articleTextColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        16.verticalSpace,
        Row(
          children: [
            Expanded(
              child: _buildImageGrid(context, controller),
            ),
            16.horizontalSpace,
            _buildAddImageButton(context, controller),
          ],
        ),
        16.verticalSpace,
        _buildImageRules(context),
      ],
    );
  }

  Widget _buildImageGrid(
      BuildContext context, CreateArticleController controller) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: Colors.grey.withValues(alpha: 0.1),
        borderRadius: kRadiusAll(8),
        border: Border.all(
          color: Colors.grey.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: controller.selectedImages.isEmpty
          ? Center(
              child: Text(
                "No images selected",
                style: context.label12400.copyWith(
                  color: Colors.grey.withValues(alpha: 0.6),
                ),
              ),
            )
          : GridView.builder(
              padding: EdgeInsets.all(8),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 1,
              ),
              itemCount: controller.selectedImages.length,
              itemBuilder: (context, index) {
                return CustomImageGridItem(
                  imageFile: controller.selectedImages[index],
                  onRemove: () => controller.removeImage(index),
                  size: 80,
                  borderRadius: 6,
                );
              },
            ),
    );
  }

  Widget _buildAddImageButton(
      BuildContext context, CreateArticleController controller) {
    return GestureDetector(
      onTap: controller.pickImages,
      child: Container(
        width: 100,
        height: 120,
        decoration: BoxDecoration(
          color: Colors.grey.withValues(alpha: 0.1),
          borderRadius: kRadiusAll(8),
          border: Border.all(
            color: Colors.grey.withValues(alpha: 0.3),
            width: 1,
            style: BorderStyle.solid,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: AppColors.pink.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.cloud_upload,
                size: 20,
                color: AppColors.pink,
              ),
            ),
            8.verticalSpace,
            Text(
              "Add images",
              style: context.label12400.copyWith(
                color: AppColors.pink,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageRules(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Image Rules:",
          style: context.label12400.copyWith(
            color: AppColors.articleTextColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        8.verticalSpace,
        Row(
          children: [
            Icon(
              Icons.circle,
              size: 6,
              color: Colors.grey.withValues(alpha: 0.6),
            ),
            8.horizontalSpace,
            Text(
              "One mandatory, Maximum 8",
              style: context.label12400.copyWith(
                color: Colors.grey.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
        4.verticalSpace,
        Row(
          children: [
            Icon(
              Icons.circle,
              size: 6,
              color: Colors.grey.withValues(alpha: 0.6),
            ),
            8.horizontalSpace,
            Text(
              "Multiple (Optional)",
              style: context.label12400.copyWith(
                color: Colors.grey.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButtons(
      BuildContext context, CreateArticleController controller) {
    return Row(
      children: [
        CustomButton(
          text: "Cancel",
          onTap: controller.onCancel,
          backgroundColor: Colors.grey.withValues(alpha: 0.1),
          width: 200,
          isPrimary: false,
        ),
        16.horizontalSpace,
        CustomButton(
          text: "Save",
          onTap: controller.onSave,
          backgroundColor: AppColors.pink,
          textStyle: context.label14400.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
          width: 200,
        ),
      ],
    );
  }
}

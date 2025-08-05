import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nextbestie_admin/core/constants/app_colors.dart';
import 'package:nextbestie_admin/core/utils/dimension.dart';

class CustomImagePicker extends StatelessWidget {
  final XFile imageFile;
  final double? width;
  final double? height;
  final double borderRadius;
  final BoxFit fit;
  final VoidCallback? onRemove;
  final bool showRemoveButton;
  final Color? backgroundColor;
  final Widget? loadingWidget;
  final Widget? errorWidget;

  const CustomImagePicker({
    super.key,
    required this.imageFile,
    this.width,
    this.height,
    this.borderRadius = 6,
    this.fit = BoxFit.cover,
    this.onRemove,
    this.showRemoveButton = true,
    this.backgroundColor,
    this.loadingWidget,
    this.errorWidget,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List>(
      future: imageFile.readAsBytes(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _buildLoadingContainer(context);
        }

        if (snapshot.hasData) {
          return _buildImageContainer(context, snapshot.data!);
        }

        return _buildErrorContainer(context);
      },
    );
  }

  Widget _buildLoadingContainer(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.grey.withValues(alpha: 0.2),
        borderRadius: kRadiusAll(borderRadius),
      ),
      child: loadingWidget ??
          Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.pink),
            ),
          ),
    );
  }

  Widget _buildImageContainer(BuildContext context, Uint8List imageBytes) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: kRadiusAll(borderRadius),
        image: DecorationImage(
          image: MemoryImage(imageBytes),
          fit: fit,
        ),
      ),
      child: showRemoveButton && onRemove != null
          ? Stack(
              children: [
                Positioned(
                  top: 4,
                  right: 4,
                  child: GestureDetector(
                    onTap: onRemove,
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.6),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.close,
                        size: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            )
          : null,
    );
  }

  Widget _buildErrorContainer(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.grey.withValues(alpha: 0.2),
        borderRadius: kRadiusAll(borderRadius),
      ),
      child: errorWidget ??
          Center(
            child: Icon(
              Icons.error,
              color: Colors.grey.withValues(alpha: 0.5),
            ),
          ),
    );
  }
}

// Convenience widget for image grid items
class CustomImageGridItem extends StatelessWidget {
  final XFile imageFile;
  final VoidCallback? onRemove;
  final double size;
  final double borderRadius;

  const CustomImageGridItem({
    super.key,
    required this.imageFile,
    this.onRemove,
    this.size = 80,
    this.borderRadius = 6,
  });

  @override
  Widget build(BuildContext context) {
    return CustomImagePicker(
      imageFile: imageFile,
      width: size,
      height: size,
      borderRadius: borderRadius,
      onRemove: onRemove,
      showRemoveButton: onRemove != null,
    );
  }
}

// Convenience widget for image preview
class CustomImagePreview extends StatelessWidget {
  final XFile imageFile;
  final double? width;
  final double? height;
  final double borderRadius;

  const CustomImagePreview({
    super.key,
    required this.imageFile,
    this.width,
    this.height,
    this.borderRadius = 8,
  });

  @override
  Widget build(BuildContext context) {
    return CustomImagePicker(
      imageFile: imageFile,
      width: width,
      height: height,
      borderRadius: borderRadius,
      showRemoveButton: false,
    );
  }
}

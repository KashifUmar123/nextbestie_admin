import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nextbestie_admin/core/base/base_controller.dart';

class CreateArticleController extends BaseController {
  CreateArticleController(super.iNavigator);

  // Text controllers
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  // Image management
  List<XFile> selectedImages = [];

  @override
  void onInit() {
    super.onInit();
    // Initialize with default values if needed
    titleController.text = "Tech weekly";
    descriptionController.text =
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";
  }

  @override
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();
    super.onClose();
  }

  // Pick images from gallery/camera
  void pickImages() async {
    if (selectedImages.length >= 8) {
      // Show message that maximum images reached
      return;
    }

    final ImagePicker picker = ImagePicker();
    final List<XFile> images = await picker.pickMultiImage();

    if (images.isNotEmpty) {
      // Add images up to the maximum limit
      for (XFile image in images) {
        if (selectedImages.length < 8) {
          selectedImages.add(image);
        } else {
          break;
        }
      }
      update();
    }
  }

  // Remove image at specific index
  void removeImage(int index) {
    if (index >= 0 && index < selectedImages.length) {
      selectedImages.removeAt(index);
      update();
    }
  }

  // Cancel action
  void onCancel() {
    // Clear form and navigate back
    titleController.clear();
    descriptionController.clear();
    selectedImages.clear();
    update();
    iNavigator.pop();
  }

  // Save article
  void onSave() {
    // Validate form
    if (titleController.text.trim().isEmpty) {
      // Show error for empty title
      return;
    }

    if (selectedImages.isEmpty) {
      // Show error for no images (one mandatory)
      return;
    }

    debugPrint("Saving article:");
    debugPrint("Title: ${titleController.text}");
    debugPrint("Description: ${descriptionController.text}");
    debugPrint("Images: ${selectedImages.length}");

    // Navigate back after saving
    iNavigator.pop();
  }
}

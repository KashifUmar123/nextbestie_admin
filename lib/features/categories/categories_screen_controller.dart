import 'package:flutter/material.dart';
import 'package:nextbestie_admin/core/base/base_controller.dart';
import 'package:nextbestie_admin/core/models/category_model.dart';
import 'package:nextbestie_admin/core/pages/route_names.dart';
import 'package:nextbestie_admin/core/widgets/add_category_dialogue.dart';

class CategoriesScreenController extends BaseController {
  CategoriesScreenController(super.iNavigator);

  final ScrollController scrollController = ScrollController();

  // Articles list
  List<CategoryModel> categories = [];

  // Pagination state
  bool isLoadingMore = false;
  int currentPage = 1;
  bool hasMoreData = true;
  final int itemsPerPage = 10;

  final List<CategoryModel> allCategories = [
    CategoryModel(
      id: 'cat1',
      title: 'Technology',
      description: 'Latest tech news & tutorials',
      createdAt: DateTime(2023, 1, 1),
      updatedAt: DateTime(2023, 1, 1),
    ),
    CategoryModel(
      id: 'cat2',
      title: 'Sports',
      description: 'Updates from the world of sports',
      createdAt: DateTime(2023, 1, 2),
      updatedAt: DateTime(2023, 1, 2),
    ),
    CategoryModel(
      id: 'cat3',
      title: 'Health',
      description: 'Health tips and medical news',
      createdAt: DateTime(2023, 1, 3),
      updatedAt: DateTime(2023, 1, 3),
    ),
    CategoryModel(
      id: 'cat4',
      title: 'Entertainment',
      description: 'Movies, music, and celebrity gossip',
      createdAt: DateTime(2023, 1, 4),
      updatedAt: DateTime(2023, 1, 4),
    ),
    CategoryModel(
      id: 'cat5',
      title: 'Business',
      description: 'Market insights and business news',
      createdAt: DateTime(2023, 1, 5),
      updatedAt: DateTime(2023, 1, 5),
    ),
    CategoryModel(
      id: 'cat6',
      title: 'Science',
      description: 'Discoveries and research highlights',
      createdAt: DateTime(2023, 1, 6),
      updatedAt: DateTime(2023, 1, 6),
    ),
    CategoryModel(
      id: 'cat7',
      title: 'Travel',
      description: 'Destinations, tips, and guides',
      createdAt: DateTime(2023, 1, 7),
      updatedAt: DateTime(2023, 1, 7),
    ),
    CategoryModel(
      id: 'cat8',
      title: 'Food',
      description: 'Recipes and restaurant reviews',
      createdAt: DateTime(2023, 1, 8),
      updatedAt: DateTime(2023, 1, 8),
    ),
    CategoryModel(
      id: 'cat9',
      title: 'Education',
      description: 'Learning resources and news',
      createdAt: DateTime(2023, 1, 9),
      updatedAt: DateTime(2023, 1, 9),
    ),
    CategoryModel(
      id: 'cat10',
      title: 'Fashion',
      description: 'Style trends and tips',
      createdAt: DateTime(2023, 1, 10),
      updatedAt: DateTime(2023, 1, 10),
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    loadInitialCategories();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  // Load initial articles
  void loadInitialCategories() {
    // Load first page of articles
    final startIndex = 0;
    final endIndex = itemsPerPage.clamp(0, allCategories.length);

    categories = allCategories.sublist(startIndex, endIndex);
    currentPage = 1;
    hasMoreData = allCategories.length > itemsPerPage;
    update();
  }

  void onAddNewCategory(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AddCategoryDialogue(
        leftButton: 'Add',
        rightButton: 'Cancel',
        // If your CustomDialogueBox supports callbacks, wire them:
      ),
    );
  }
}

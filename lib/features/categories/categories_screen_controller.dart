import 'package:flutter/material.dart';
import 'package:nextbestie_admin/core/base/base_controller.dart';

class Categories {
  final String title;
  final String category;

  Categories({
    required this.title,
    required this.category,
  });
}

class CategoriesScreenController extends BaseController {
  CategoriesScreenController(super.iNavigator);

  final ScrollController scrollController = ScrollController();

  // Articles list
  List<Categories> categories = [];

  // Pagination state
  bool isLoadingMore = false;
  int currentPage = 1;
  bool hasMoreData = true;
  final int itemsPerPage = 10;

  final List<Categories> allCategories = [
    Categories(title: 'Technology', category: 'technology'),
    Categories(title: 'Health', category: 'health'),
    Categories(title: 'Finance', category: 'finance'),
    Categories(title: 'Sports', category: 'sports'),
    Categories(title: 'Entertainment', category: 'entertainment'),
    Categories(title: 'Science', category: 'science'),
    Categories(title: 'Travel', category: 'travel'),
    Categories(title: 'Food', category: 'food'),
    Categories(title: 'Business', category: 'business'),
    Categories(title: 'Education', category: 'education'),
    Categories(title: 'Culture', category: 'culture'),
    Categories(title: 'Environment', category: 'environment'),
    Categories(title: 'Politics', category: 'politics'),
    Categories(title: 'Lifestyle', category: 'lifestyle'),
    Categories(title: 'Fashion', category: 'fashion'),
    Categories(title: 'Gaming', category: 'gaming'),
    Categories(title: 'Music', category: 'music'),
    Categories(title: 'Real Estate', category: 'real_estate'),
    Categories(title: 'Automotive', category: 'automotive'),
    Categories(title: 'Pets', category: 'pets'),
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
    final endIndex = itemsPerPage;
    categories = allCategories.sublist(startIndex, endIndex);
    currentPage = 1;
    hasMoreData = allCategories.length > itemsPerPage;
    update();
  }
}

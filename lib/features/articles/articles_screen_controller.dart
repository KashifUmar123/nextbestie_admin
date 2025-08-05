import 'package:flutter/material.dart';
import 'package:nextbestie_admin/core/base/base_controller.dart';
import 'package:nextbestie_admin/core/pages/route_names.dart';

class Article {
  final String title;
  final String category;
  final String lastEdited;

  Article({
    required this.title,
    required this.category,
    required this.lastEdited,
  });
}

class ArticlesScreenController extends BaseController {
  ArticlesScreenController(super.iNavigator);

  // Scroll controller for pagination
  final ScrollController scrollController = ScrollController();

  // Articles list
  List<Article> articles = [];

  // Pagination state
  bool isLoadingMore = false;
  int currentPage = 1;
  bool hasMoreData = true;
  final int itemsPerPage = 10;

  // All dummy articles
  final List<Article> allArticles = [
    Article(
        title: "Tech weekly", category: "Technology", lastEdited: "2025-03-21"),
    Article(
        title: "Health digest", category: "Health", lastEdited: "2025-03-21"),
    Article(
        title: "Finance insights",
        category: "Finance",
        lastEdited: "2025-03-21"),
    Article(
        title: "Sports roundup", category: "Sports", lastEdited: "2025-03-20"),
    Article(
        title: "Entertainment news",
        category: "Entertainment",
        lastEdited: "2025-03-20"),
    Article(
        title: "Science discoveries",
        category: "Science",
        lastEdited: "2025-03-19"),
    Article(
        title: "Travel guide", category: "Travel", lastEdited: "2025-03-19"),
    Article(title: "Food recipes", category: "Food", lastEdited: "2025-03-18"),
    Article(
        title: "Business trends",
        category: "Business",
        lastEdited: "2025-03-18"),
    Article(
        title: "Education insights",
        category: "Education",
        lastEdited: "2025-03-17"),
    Article(
        title: "Art and culture",
        category: "Culture",
        lastEdited: "2025-03-17"),
    Article(
        title: "Environmental news",
        category: "Environment",
        lastEdited: "2025-03-16"),
    Article(
        title: "Politics today",
        category: "Politics",
        lastEdited: "2025-03-16"),
    Article(
        title: "Lifestyle tips",
        category: "Lifestyle",
        lastEdited: "2025-03-15"),
    Article(
        title: "Fashion trends", category: "Fashion", lastEdited: "2025-03-15"),
    Article(
        title: "Movie reviews",
        category: "Entertainment",
        lastEdited: "2025-03-14"),
    Article(
        title: "Book recommendations",
        category: "Literature",
        lastEdited: "2025-03-14"),
    Article(title: "Gaming news", category: "Gaming", lastEdited: "2025-03-13"),
    Article(
        title: "Music industry", category: "Music", lastEdited: "2025-03-13"),
    Article(
        title: "Real estate market",
        category: "Real Estate",
        lastEdited: "2025-03-12"),
    Article(
        title: "Automotive news",
        category: "Automotive",
        lastEdited: "2025-03-12"),
    Article(
        title: "Pet care guide", category: "Pets", lastEdited: "2025-03-11"),
    Article(
        title: "Fitness tips", category: "Fitness", lastEdited: "2025-03-11"),
    Article(
        title: "Mental health", category: "Health", lastEdited: "2025-03-10"),
    Article(
        title: "Investment strategies",
        category: "Finance",
        lastEdited: "2025-03-10"),
    Article(
        title: "Home improvement", category: "Home", lastEdited: "2025-03-09"),
    Article(
        title: "Gardening tips",
        category: "Gardening",
        lastEdited: "2025-03-09"),
    Article(
        title: "Photography guide",
        category: "Photography",
        lastEdited: "2025-03-08"),
    Article(
        title: "Cooking techniques",
        category: "Food",
        lastEdited: "2025-03-08"),
    Article(title: "DIY projects", category: "DIY", lastEdited: "2025-03-07"),
    Article(
        title: "Parenting advice",
        category: "Parenting",
        lastEdited: "2025-03-07"),
    Article(
        title: "Career development",
        category: "Career",
        lastEdited: "2025-03-06"),
    Article(
        title: "Technology reviews",
        category: "Technology",
        lastEdited: "2025-03-06"),
    Article(
        title: "Travel destinations",
        category: "Travel",
        lastEdited: "2025-03-05"),
    Article(
        title: "Wellness practices",
        category: "Wellness",
        lastEdited: "2025-03-05"),
  ];

  @override
  void onInit() {
    super.onInit();
    loadInitialArticles();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  // Load initial articles
  void loadInitialArticles() {
    // Load first page of articles
    final startIndex = 0;
    final endIndex = itemsPerPage;
    articles = allArticles.sublist(startIndex, endIndex);
    currentPage = 1;
    hasMoreData = allArticles.length > itemsPerPage;
    update();
  }

  void onAddNewArticle() {
    iNavigator.pushNamed(RouteNames.addArticle);
  }

  // Load more articles for pagination
  void loadMoreArticles() {
    if (isLoadingMore || !hasMoreData) return;

    isLoadingMore = true;
    update();

    // Simulate API call delay
    Future.delayed(Duration(milliseconds: 800), () {
      final startIndex = currentPage * itemsPerPage;
      final endIndex = (startIndex + itemsPerPage).clamp(0, allArticles.length);

      if (startIndex < allArticles.length) {
        final newArticles = allArticles.sublist(startIndex, endIndex);
        articles.addAll(newArticles);
        currentPage++;

        // Check if there are more articles to load
        hasMoreData = endIndex < allArticles.length;
      } else {
        hasMoreData = false;
      }

      isLoadingMore = false;
      update();
    });
  }

  // Edit article
  void editArticle(Article article) {
    debugPrint("Edit article: ${article.title}");
  }

  // Delete article
  void deleteArticle(Article article) {
    debugPrint("Delete article: ${article.title}");
    articles.remove(article);
    allArticles.remove(article);
    update();
  }
}

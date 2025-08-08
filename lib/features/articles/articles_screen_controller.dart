import 'package:flutter/material.dart';
import 'package:nextbestie_admin/core/base/base_controller.dart';
import 'package:nextbestie_admin/core/models/article_model.dart';
import 'package:nextbestie_admin/core/models/category_model.dart';
import 'package:nextbestie_admin/core/pages/route_names.dart';
import 'package:nextbestie_admin/core/widgets/custom_dialogue_box.dart';

class ArticlesScreenController extends BaseController {
  ArticlesScreenController(super.iNavigator);

  // Scroll controller for pagination
  final ScrollController scrollController = ScrollController();

  // Articles list
  List<ArticleModel> articles = [];

  // Pagination state
  bool isLoadingMore = false;
  int currentPage = 1;
  bool hasMoreData = true;
  final int itemsPerPage = 10;

  // All dummy articles with categories in it

  final List<CategoryModel> dummyCategories = [
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
  List<ArticleModel> allArticles = [];

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
    allArticles = List.generate(10, (i) {
      final cat = dummyCategories[i];
      return ArticleModel(
        id: 'art${i + 1}',
        title: '${cat.title} Article ${i + 1}',
        subtitle: 'Subtitle for ${cat.title} Article ${i + 1}',
        content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        media: ['https://example.com/${cat.id}/img${i + 1}.jpg'],
        createdAt: DateTime(2023, 2, i + 1),
        updatedAt: DateTime(2023, 2, i + 1),
        createdBy: 'Admin',
        categoryId: cat.id!,
        category: cat,
        likeCount: (i + 1) * 5,
        commentsCount: (i + 1) * 2,
      );
    });
    // Load first page of articles
    final startIndex = 0;
    final endIndex = itemsPerPage.clamp(0, allArticles.length);
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
  void editArticle(ArticleModel article) {
    debugPrint("Edit article: ${article.title}");
  }

  // Delete article
  void deleteArticle(ArticleModel article) {
    debugPrint("Delete article: ${article.title}");
    articles.remove(article);
    allArticles.remove(article);
    update();
  }

  void onDeleteArticleDialogue(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (_) => CustomDialogueBox(
        title: title,
        description: 'Are you sure you want to delete this article?',
        leftButton: 'Delete',
        rightButton: 'Cancel',
        // If your CustomDialogueBox supports callbacks, wire them:
      ),
    );
  }
}

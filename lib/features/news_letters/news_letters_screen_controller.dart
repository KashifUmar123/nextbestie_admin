import 'package:flutter/material.dart';
import 'package:nextbestie_admin/core/base/base_controller.dart';

class NewsLetter {
  final String title;
  final String lastEdited;

  NewsLetter({
    required this.title,
    required this.lastEdited,
  });
}

class NewsLettersScreenController extends BaseController {
  NewsLettersScreenController(super.iNavigator);

  ScrollController scrollController = ScrollController();

  List<NewsLetter> newsLetters = [];

  // Pagination state
  bool isLoadingMore = false;
  int currentPage = 1;
  bool hasMoreData = true;
  final int itemsPerPage = 10;

  final List<NewsLetter> allNewsLetters = [
    NewsLetter(title: 'Tech Trends Weekly', lastEdited: '2025-03-21'),
    NewsLetter(title: 'Health & Wellness Digest', lastEdited: '2025-03-20'),
    NewsLetter(title: 'Finance Focus', lastEdited: '2025-03-19'),
    NewsLetter(title: 'Sports Spotlight', lastEdited: '2025-03-18'),
    NewsLetter(title: 'Entertainment Express', lastEdited: '2025-03-17'),
    NewsLetter(title: 'Science Snapshot', lastEdited: '2025-03-16'),
    NewsLetter(title: 'Travel Times', lastEdited: '2025-03-15'),
    NewsLetter(title: 'Foodie Favorites', lastEdited: '2025-03-14'),
    NewsLetter(title: 'Business Brief', lastEdited: '2025-03-13'),
    NewsLetter(title: 'Education Essentials', lastEdited: '2025-03-12'),
    NewsLetter(title: 'Culture Connect', lastEdited: '2025-03-11'),
    NewsLetter(title: 'Green Living Guide', lastEdited: '2025-03-10'),
    NewsLetter(title: 'Political Pulse', lastEdited: '2025-03-09'),
    NewsLetter(title: 'Lifestyle Lowdown', lastEdited: '2025-03-08'),
    NewsLetter(title: 'Fashion Forward', lastEdited: '2025-03-07'),
    NewsLetter(title: 'Gaming Gazette', lastEdited: '2025-03-06'),
    NewsLetter(title: 'Music Monthly', lastEdited: '2025-03-05'),
    NewsLetter(title: 'Real Estate Review', lastEdited: '2025-03-04'),
    NewsLetter(title: 'Automotive Alert', lastEdited: '2025-03-03'),
    NewsLetter(title: 'Pet Care Chronicles', lastEdited: '2025-03-02'),
  ];

  @override
  void onInit() {
    super.onInit();
    loadInitialNewsLetters();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  // Load initial articles
  void loadInitialNewsLetters() {
    // Load first page of articles
    final startIndex = 0;
    final endIndex = itemsPerPage;
    newsLetters = allNewsLetters.sublist(startIndex, endIndex);
    currentPage = 1;
    hasMoreData = allNewsLetters.length > itemsPerPage;
    update();
  }
}

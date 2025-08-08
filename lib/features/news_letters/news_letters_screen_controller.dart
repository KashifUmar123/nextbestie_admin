import 'package:flutter/material.dart';
import 'package:nextbestie_admin/core/base/base_controller.dart';
import 'package:nextbestie_admin/core/models/newsletter_model.dart';
import 'package:nextbestie_admin/core/pages/route_names.dart';
import 'package:nextbestie_admin/core/widgets/custom_dialogue_box.dart';

class NewsLettersScreenController extends BaseController {
  NewsLettersScreenController(super.iNavigator);

  ScrollController scrollController = ScrollController();

  List<NewsletterModel> newsLetters = [];

  // Pagination state
  bool isLoadingMore = false;
  int currentPage = 1;
  bool hasMoreData = true;
  final int itemsPerPage = 10;

  List<NewsletterModel> allNewsLetters = [];

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
    allNewsLetters = List.generate(10, (i) {
      return NewsletterModel(
        id: 'nl${i + 1}',
        title: 'Weekly Digest #${i + 1}',
        content: 'This is the content of newsletter #${i + 1}.',
        media: ['https://example.com/newsletter/img${i + 1}.png'],
        createdAt: DateTime(2023, 4, i + 1),
        updatedAt: DateTime(2023, 4, i + 1),
        commentsCount: i * 3,
      );
    });

    final startIndex = 0;
    final endIndex = itemsPerPage.clamp(0, allNewsLetters.length);
    newsLetters = allNewsLetters.sublist(startIndex, endIndex);
    currentPage = 1;
    hasMoreData = allNewsLetters.length > itemsPerPage;
    update();
  }

  void onAddNewNewsLetter() {
    iNavigator.pushNamed(RouteNames.addNewsletter);
  }

  void onDeleteNewsLetterDialogue(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (_) => CustomDialogueBox(
        title: title,
        description: 'Are you sure you want to delete this newsletter?',
        leftButton: 'Delete',
        rightButton: 'Cancel',
        // If your CustomDialogueBox supports callbacks, wire them:
      ),
    );
  }
}

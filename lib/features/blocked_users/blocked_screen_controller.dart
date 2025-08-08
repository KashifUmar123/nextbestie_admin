import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nextbestie_admin/core/base/base_controller.dart';
import 'package:nextbestie_admin/core/widgets/custom_dialogue_box.dart';

class BlockedUser {
  String name;

  BlockedUser({required this.name});
}

class BlockedScreenController extends BaseController {
  BlockedScreenController(super.iNavigator);

  ScrollController scrollController = ScrollController();

  List<BlockedUser> blockedUsers = [];

  // Pagination state
  bool isLoadingMore = false;
  int currentPage = 1;
  bool hasMoreData = true;
  final int itemsPerPage = 10;

  List<BlockedUser> allBlockedUsers = [
    BlockedUser(name: 'Alice Smith'),
    BlockedUser(name: 'Bob Johnson'),
    BlockedUser(name: 'Charlie Lee'),
    BlockedUser(name: 'Danielle Kim'),
    BlockedUser(name: 'Ethan Clark'),
    BlockedUser(name: 'Fiona Wilson'),
    BlockedUser(name: 'Alice Smith'),
    BlockedUser(name: 'Bob Johnson'),
    BlockedUser(name: 'Charlie Lee'),
    BlockedUser(name: 'Danielle Kim'),
    BlockedUser(name: 'Ethan Clark'),
    BlockedUser(name: 'Fiona Wilson'),
  ];

  @override
  void onInit() {
    super.onInit();
    loadBlockedUsersLetters();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  // Load initial articles
  void loadBlockedUsersLetters() {
    // Load first page of articles
    final startIndex = 0;
    final endIndex = itemsPerPage;
    // final endIndex = min(startIndex + itemsPerPage, allBlockedUsers.length);
    blockedUsers = allBlockedUsers.sublist(startIndex, endIndex);
    currentPage = 1;
    hasMoreData = allBlockedUsers.length > itemsPerPage;
    update();
  }

  void unblockUserDialogue(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => CustomDialogueBox(
        title: 'Unblock User',
        description: 'Are you sure you want to unblock this user?',
        leftButton: 'Unblock',
        rightButton: 'Cancel',
        // If your CustomDialogueBox supports callbacks, wire them:
      ),
    );
  }
}

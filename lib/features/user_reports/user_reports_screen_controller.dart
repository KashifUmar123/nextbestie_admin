import 'package:flutter/material.dart';
import 'package:nextbestie_admin/core/base/base_controller.dart';
import 'package:nextbestie_admin/core/pages/route_names.dart';

class UserReports {
  final String userName;
  final String reportData;

  UserReports({
    required this.userName,
    required this.reportData,
  });
}

class UserReportsScreenController extends BaseController {
  UserReportsScreenController(super.iNavigator);

  ScrollController scrollController = ScrollController();

  List<UserReports> userReports = [];

  // Pagination state
  bool isLoadingMore = false;
  int currentPage = 1;
  bool hasMoreData = true;
  final int itemsPerPage = 10;

  final List<UserReports> allUserReports = [
    UserReports(userName: 'alice_smith', reportData: '2025-03-21'),
    UserReports(userName: 'bob_johnson', reportData: '2025-03-20'),
    UserReports(userName: 'charlie_lee', reportData: '2025-03-19'),
    UserReports(userName: 'danielle_kim', reportData: '2025-03-18'),
    UserReports(userName: 'ethan_clark', reportData: '2025-03-17'),
    UserReports(userName: 'fiona_wilson', reportData: '2025-03-16'),
    UserReports(userName: 'george_martin', reportData: '2025-03-15'),
    UserReports(userName: 'hannah_brown', reportData: '2025-03-14'),
    UserReports(userName: 'ian_davis', reportData: '2025-03-13'),
    UserReports(userName: 'julia_garcia', reportData: '2025-03-12'),
    UserReports(userName: 'kevin_moore', reportData: '2025-03-11'),
    UserReports(userName: 'laura_martinez', reportData: '2025-03-10'),
    UserReports(userName: 'michael_taylor', reportData: '2025-03-09'),
    UserReports(userName: 'nina_anderson', reportData: '2025-03-08'),
    UserReports(userName: 'oliver_thomas', reportData: '2025-03-07'),
    UserReports(userName: 'paula_jackson', reportData: '2025-03-06'),
    UserReports(userName: 'quentin_white', reportData: '2025-03-05'),
    UserReports(userName: 'rachel_harris', reportData: '2025-03-04'),
    UserReports(userName: 'steven_clark', reportData: '2025-03-03'),
    UserReports(userName: 'tina_lewis', reportData: '2025-03-02'),
  ];

  @override
  void onInit() {
    super.onInit();
    loadUserReportsLetters();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  // Load initial articles
  void loadUserReportsLetters() {
    // Load first page of articles
    final startIndex = 0;
    final endIndex = itemsPerPage;
    userReports = allUserReports.sublist(startIndex, endIndex);
    currentPage = 1;
    hasMoreData = allUserReports.length > itemsPerPage;
    update();
  }

  void navigateToUserDetails() {
    iNavigator.pushNamed(RouteNames.userDetails);
  }
}

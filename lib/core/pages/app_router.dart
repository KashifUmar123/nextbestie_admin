import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nextbestie_admin/core/pages/route_names.dart';
import 'package:nextbestie_admin/core/services/route_middleware.dart';
import 'package:nextbestie_admin/features/articles/articles_screen_view.dart';
import 'package:nextbestie_admin/features/blocked_users/blocked_screen_view.dart';
import 'package:nextbestie_admin/features/categories/categories_screen_view.dart';
import 'package:nextbestie_admin/features/create_article/create_article_screen.dart';
import 'package:nextbestie_admin/features/create_new_news_letter/create_new_news_letter_screen_view.dart';
import 'package:nextbestie_admin/features/home/home_layout.dart';
import 'package:nextbestie_admin/features/login/login_screen_view.dart';
import 'package:nextbestie_admin/features/news_letters/news_letters_screen_view.dart';
import 'package:nextbestie_admin/features/splash/splash_screen_view.dart';
import 'package:nextbestie_admin/features/user_details/user_details_screen_view.dart';
import 'package:nextbestie_admin/features/user_reports/user_reports_screen_view.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();

  static GoRouter get router => GoRouter(
        navigatorKey: _rootNavigatorKey,
        initialLocation: RouteNames.splash,
        redirect: RouteMiddleware.redirect,
        routes: [
          GoRoute(
            path: RouteNames.splash,
            name: RouteNames.splash,
            builder: (context, state) => const SplashScreenView(),
          ),
          GoRoute(
            path: RouteNames.login,
            name: RouteNames.login,
            builder: (context, state) => const LoginScreenView(),
          ),
          // Shell route for home with fixed sidebar
          ShellRoute(
            builder: (context, state, child) {
              return HomeLayout(child: child);
            },
            routes: [
              GoRoute(
                path: RouteNames.articles,
                name: RouteNames.articles,
                builder: (context, state) => const ArticlesScreenView(),
              ),
              GoRoute(
                path: RouteNames.addArticle,
                name: RouteNames.addArticle,
                builder: (context, state) => const CreateArticleScreen(),
              ),
              GoRoute(
                path: RouteNames.categories,
                name: RouteNames.categories,
                builder: (context, state) => const CategoriesScreenView(),
              ),
              GoRoute(
                path: RouteNames.addCategory,
                name: RouteNames.addCategory,
                builder: (context, state) =>
                    // const CreateNewCategoryScreenView(),
                    SizedBox(),
              ),
              GoRoute(
                path: RouteNames.newsletters,
                name: RouteNames.newsletters,
                builder: (context, state) => const NewsLettersScreenView(),
              ),
              GoRoute(
                path: RouteNames.addNewsletter,
                name: RouteNames.addNewsletter,
                builder: (context, state) =>
                    const CreateNewNewsLetterScreenView(),
              ),
              GoRoute(
                path: RouteNames.userReports,
                name: RouteNames.userReports,
                builder: (context, state) => const UserReportsScreenView(),
              ),
              GoRoute(
                path: RouteNames.blockedUsers,
                name: RouteNames.blockedUsers,
                builder: (context, state) {
                  return const BlockedScreenView();
                },
              ),
              GoRoute(
                path: RouteNames.userDetails,
                name: RouteNames.userDetails,
                builder: (context, state) {
                  return const UserDetailsScreenView();
                },
              ),
            ],
          ),
        ],
      );

  static GlobalKey<NavigatorState> get rootNavigatorKey => _rootNavigatorKey;
}

class NoTransitionPage extends Page {
  final Widget child;

  const NoTransitionPage({required this.child});

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
      settings: this,
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
      maintainState: true,
    );
  }
}

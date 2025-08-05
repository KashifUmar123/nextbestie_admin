import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nextbestie_admin/core/pages/route_names.dart';
import 'package:nextbestie_admin/core/services/route_middleware.dart';
import 'package:nextbestie_admin/features/articles/articles_screen_view.dart';
import 'package:nextbestie_admin/features/home/home_layout.dart';
import 'package:nextbestie_admin/features/login/login_screen_view.dart';
import 'package:nextbestie_admin/features/splash/splash_screen_view.dart';

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
                path: RouteNames.home,
                name: RouteNames.home,
                builder: (context, state) =>
                    const Center(child: Text('Dashboard')),
              ),
              GoRoute(
                path: RouteNames.dashboard,
                name: RouteNames.dashboard,
                builder: (context, state) =>
                    const Center(child: Text('Dashboard')),
              ),
              GoRoute(
                path: RouteNames.articles,
                name: RouteNames.articles,
                builder: (context, state) => const ArticlesScreenView(),
              ),
              GoRoute(
                path: RouteNames.addArticle,
                name: RouteNames.addArticle,
                builder: (context, state) =>
                    const Center(child: Text('Add Article')),
              ),
              GoRoute(
                path: RouteNames.categories,
                name: RouteNames.categories,
                builder: (context, state) =>
                    const Center(child: Text('Categories')),
              ),
              GoRoute(
                path: RouteNames.addCategory,
                name: RouteNames.addCategory,
                builder: (context, state) =>
                    const Center(child: Text('Add Category')),
              ),
              GoRoute(
                path: RouteNames.newsletters,
                name: RouteNames.newsletters,
                builder: (context, state) =>
                    const Center(child: Text('Newsletters')),
              ),
              GoRoute(
                path: RouteNames.addNewsletter,
                name: RouteNames.addNewsletter,
                builder: (context, state) =>
                    const Center(child: Text('Add Newsletter')),
              ),
              GoRoute(
                path: RouteNames.userReports,
                name: RouteNames.userReports,
                builder: (context, state) =>
                    const Center(child: Text('User Reports')),
              ),
              GoRoute(
                path: RouteNames.blockedUsers,
                name: RouteNames.blockedUsers,
                builder: (context, state) {
                  return const Center(child: Text('Blocked Users'));
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

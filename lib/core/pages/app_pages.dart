import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nextbestie_admin/core/pages/route_names.dart';
import 'package:nextbestie_admin/core/services/route_middleware.dart';
import 'package:nextbestie_admin/features/home/home_screen_bindings.dart';
import 'package:nextbestie_admin/features/home/home_screen_view.dart';
import 'package:nextbestie_admin/features/login/login_screen_bindings.dart';
import 'package:nextbestie_admin/features/login/login_screen_view.dart';
import 'package:nextbestie_admin/features/splash/splash_screen_bindings.dart';
import 'package:nextbestie_admin/features/splash/splash_screen_view.dart';

class AppRoutes {
  static const initialRoute = RouteNames.splash;
  static List<GetPage> pages = [
    getPage(
      name: RouteNames.splash,
      page: const SplashScreenView(),
      binding: SplashScreenBindings(),
    ),
    getPage(
      name: RouteNames.login,
      page: const LoginScreenView(),
      binding: LoginScreenBindings(),
    ),
    getPage(
      name: RouteNames.home,
      page: const HomeScreenView(),
      binding: HomeScreenBindings(),
    ),
  ];

  static GetPage getPage({
    required String name,
    required Widget page,
    Bindings? binding,
    List<Bindings>? bindings,
    dynamic arguments,
    Transition transition = Transition.fadeIn,
    curve = Curves.easeInOut,
    Duration transitionDuration = const Duration(milliseconds: 300),
    bool preventDuplicates = true,
    bool maintainState = true,
    List<GetMiddleware>? middlewares,
  }) {
    return GetPage(
      name: name,
      page: () => page,
      binding: binding,
      bindings: bindings ?? [],
      transition: transition,
      curve: curve,
      transitionDuration: transitionDuration,
      preventDuplicates: preventDuplicates,
      maintainState: maintainState,
      middlewares: middlewares ?? [RouteMiddleware()],
    );
  }
}

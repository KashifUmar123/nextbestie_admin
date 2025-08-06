import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:nextbestie_admin/core/base/admin_controller.dart';
import 'package:nextbestie_admin/core/pages/route_names.dart';

class RouteMiddleware {
  static String? redirect(BuildContext context, GoRouterState state) {
    log("MIDDLEWARE CHECK - CURRENT ROUTE: ${state.fullPath}");

    bool isAuthenticated = _checkAuthenticationStatus();
    log("MIDDLEWARE - IS AUTHENTICATED: $isAuthenticated");

    final List<String> publicRoutes = [
      RouteNames.splash,
      RouteNames.login,
    ];

    // If user is authenticated and trying to access public routes, redirect to dashboard
    if (isAuthenticated && publicRoutes.contains(state.fullPath)) {
      log("MIDDLEWARE - AUTHENTICATED USER TRYING TO ACCESS PUBLIC ROUTE, REDIRECTING TO DASHBOARD");
      return RouteNames.articles;
    }

    // If user is not authenticated and trying to access protected routes, redirect to login
    if (!isAuthenticated && !publicRoutes.contains(state.fullPath)) {
      log("MIDDLEWARE - UNAUTHENTICATED USER TRYING TO ACCESS PROTECTED ROUTE, REDIRECTING TO LOGIN");
      return RouteNames.login;
    }

    // Redirect /home to /home/dashboard for shell routing
    if (isAuthenticated && state.fullPath == RouteNames.home) {
      log("MIDDLEWARE - REDIRECTING /home TO /home/dashboard");
      return RouteNames.articles;
    }

    log("MIDDLEWARE - ALLOWING ACCESS TO: ${state.fullPath}");
    // Allow access in all other cases
    return null;
  }

  static bool _checkAuthenticationStatus() {
    try {
      return Get.find<AdminController>().isAdminLoggedIn;
    } catch (e) {
      log("MIDDLEWARE - ERROR CHECKING AUTH: $e");
      return false;
    }
  }
}

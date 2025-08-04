import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nextbestie_admin/core/base/admin_controller.dart';
import 'package:nextbestie_admin/core/pages/route_names.dart';

class RouteMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    log("CURRENT ROUTE $route");

    bool isAuthenticated = _checkAuthenticationStatus();

    final List<String> publicRoutes = [
      RouteNames.splash,
      RouteNames.login,
    ];

    // If user is authenticated and trying to access public routes, redirect to home
    if (isAuthenticated && publicRoutes.contains(route)) {
      log("AUTHENTICATED USER TRYING TO ACCESS PUBLIC ROUTE, REDIRECTING TO HOME");
      return const RouteSettings(name: RouteNames.home);
    }

    // If user is not authenticated and trying to access protected routes, redirect to login
    if (!isAuthenticated && !publicRoutes.contains(route)) {
      log("UNAUTHENTICATED USER TRYING TO ACCESS PROTECTED ROUTE, REDIRECTING TO LOGIN");
      return const RouteSettings(name: RouteNames.login);
    }

    // Allow access in all other cases
    return null;
  }

  bool _checkAuthenticationStatus() {
    return Get.find<AdminController>().isAdminLoggedIn;
  }
}

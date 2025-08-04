import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nextbestie_admin/core/pages/route_names.dart';

class RouteMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    log("CURRENT ROUTE $route");
    final List<String> publicRoutes = [
      RouteNames.splash,
      RouteNames.login,
      RouteNames.home,
    ];

    if (publicRoutes.contains(route)) {
      return null;
    }

    bool isAuthenticated = _checkAuthenticationStatus();

    if (!isAuthenticated) {
      return const RouteSettings(name: RouteNames.login);
    }

    return null;
  }

  bool _checkAuthenticationStatus() {
    return false;
  }
}

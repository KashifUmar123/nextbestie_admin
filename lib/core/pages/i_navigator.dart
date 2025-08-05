import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nextbestie_admin/admin_app.dart';

abstract class INavigator {
  BuildContext? get context;

  /// Navigate to a named route
  Future<T?>? pushNamed<T>(
    String route, {
    String? analyticKey,
    dynamic arguments,
    int? id,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
  });

  /// Pop the current route
  void pop<T>({T? result});

  /// Pop until a specific route
  void popUntil(
    String route, {
    required String analyticKey,
  });

  /// Push and replace the current route
  void pushReplacementNamed(
    String route, {
    String? analyticKey,
    dynamic arguments,
    Map<String, String>? parameters,
  });

  /// Clear all routes and push a new one
  void offAndPushNamed(
    String route, {
    String? analyticKey,
    dynamic arguments,
    int? id,
    Map<String, String>? parameters,
  });

  /// Log analytics events
  void analyticEventLog({
    required String analyticKey,
    Map<String, dynamic>? params,
  });
}

class NavigatorImpl extends INavigator {
  // ignore: unused_field
  final GoRouter _router;

  NavigatorImpl(this._router);

  @override
  BuildContext? get context => navigatorKey.currentContext;

  @override
  void pop<T>({T? result}) {
    if (context != null) {
      context?.pop<T>(result);
    }
  }

  @override
  void popUntil(String route, {String analyticKey = ''}) {
    if (context != null) {
      Navigator.of(context!).popUntil((r) => r.settings.name == route);
    }
  }

  @override
  Future<T?>? pushNamed<T>(
    String route, {
    String? analyticKey,
    dynamic arguments,
    int? id,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
  }) async {
    try {
      debugPrint("PUSHING NAMED: $route");
      return await navigatorKey.currentContext!
          .push<T>(route, extra: arguments);
    } catch (e) {
      debugPrint("ERROR PUSHING NAMED: $e");
      return null;
    }
  }

  @override
  void offAndPushNamed(
    String route, {
    String? analyticKey,
    dynamic arguments,
    int? id,
    Map<String, String>? parameters,
  }) {
    try {
      debugPrint("OFF AND PUSH NAMED: $route");
      navigatorKey.currentContext!.pushReplacement(route, extra: arguments);
    } catch (e) {
      debugPrint("ERROR OFF AND PUSH NAMED: $e");
    }
  }

  @override
  void pushReplacementNamed(
    String route, {
    String? analyticKey,
    dynamic arguments,
    Map<String, String>? parameters,
  }) {
    try {
      debugPrint("PUSH REPLACEMENT NAMED: $route");
      navigatorKey.currentContext!.pushReplacement(route, extra: arguments);
    } catch (e) {
      debugPrint("ERROR PUSH REPLACEMENT NAMED: $e");
    }
  }

  @override
  void analyticEventLog({
    required String analyticKey,
    Map<String, dynamic>? params,
  }) {
    // Implement analytics logging here
  }
}

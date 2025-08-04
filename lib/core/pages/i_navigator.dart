import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nextbestie_admin/admin_app.dart';

abstract class INavigator {
  BuildContext? get context => Get.context!;
  Future<T?>? pushNamed<T>(
    String route, {
    String? analyticKey,
    dynamic arguments,
    int? id,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
  });

  void pop<T>({T? result});

  void popUntil(
    String route, {
    required String analyticKey,
  });

  void pushReplacementNamed(
    String route, {
    String? analyticKey,
    dynamic arguments,
    Map<String, String>? parameters,
  });

  void offAndPushNamed(
    String route, {
    String? analyticKey,
    dynamic arguments,
    int? id,
    Map<String, String>? parameters,
  });

  void analyticEventLog({
    required String analyticKey,
    Map<String, dynamic>? params,
  });
}

class NavigatorImpl extends INavigator {
  @override
  BuildContext? get context => navigatorKey.currentState?.context;

  @override
  void pop<T>({T? result}) {
    Get.back<T>(result: result);
  }

  @override
  void popUntil(String route, {String analyticKey = ''}) {
    Get.until((data) => data.settings.name == route);
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
    return await Get.toNamed<T>(
      route,
      arguments: arguments,
      id: id,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
    );
  }

  @override
  void offAndPushNamed(
    String route, {
    String? analyticKey,
    dynamic arguments,
    int? id,
    Map<String, String>? parameters,
  }) {
    Get.offNamed(
      route,
      arguments: arguments,
      id: id,
      parameters: parameters,
    );
  }

  @override
  void pushReplacementNamed(
    String route, {
    String? analyticKey,
    dynamic arguments,
    Map<String, String>? parameters,
  }) {
    Get.offAllNamed(route, arguments: arguments);
  }

  @override
  void analyticEventLog({
    required String analyticKey,
    Map<String, dynamic>? params,
  }) {}
}

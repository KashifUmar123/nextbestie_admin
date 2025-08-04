import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nextbestie_admin/core/pages/app_pages.dart';
import 'package:nextbestie_admin/core/pages/route_names.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AdminApp extends StatelessWidget {
  const AdminApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppRoutes.pages,
      initialRoute: RouteNames.splash,
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      textDirection: TextDirection.ltr,
    );
  }
}

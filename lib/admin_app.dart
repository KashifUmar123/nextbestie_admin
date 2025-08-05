import 'package:flutter/material.dart';
import 'package:nextbestie_admin/core/pages/app_router.dart';

final GlobalKey<NavigatorState> navigatorKey = AppRouter.rootNavigatorKey;

class AdminApp extends StatelessWidget {
  const AdminApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      title: 'NextBestie Admin Panel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
    );
  }
}

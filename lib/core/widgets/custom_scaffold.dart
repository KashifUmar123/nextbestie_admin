import 'package:flutter/material.dart';
import 'package:nextbestie_admin/core/constants/app_colors.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    required this.body,
    this.showNavbar = true,
    this.showBackButton = true,
  });
  final Widget body;
  final bool showNavbar;
  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SizedBox(
        height: mediaQuery.size.height,
        width: mediaQuery.size.width,
        child: Column(
          children: [
            Center(
              child: SizedBox(
                width: 1100,
                child: body,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

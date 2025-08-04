import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        width: Get.width,
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

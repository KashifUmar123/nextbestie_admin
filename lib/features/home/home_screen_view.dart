import 'package:flutter/material.dart';
import 'package:nextbestie_admin/core/extension/fonts_extension.dart';
import 'package:nextbestie_admin/core/widgets/custom_scaffold.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        body: Column(
      children: [
        Center(
          child: Text(
            "Home",
            style: context.label30500,
          ),
        )
      ],
    ));
  }
}

import 'package:flutter/material.dart';

class CustomAnimatedSwitcher extends StatelessWidget {
  const CustomAnimatedSwitcher({
    required this.child,
    this.duration,
    this.reverseDuration,
    super.key,
  });

  final Widget child;
  final Duration? duration;
  final Duration? reverseDuration;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: duration ??
          const Duration(
            milliseconds: 300,
          ),
      reverseDuration: reverseDuration ??
          duration ??
          const Duration(
            milliseconds: 300,
          ),
      switchInCurve: Curves.easeIn,
      switchOutCurve: Curves.easeOut,
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      child: child,
    );
  }
}

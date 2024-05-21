import 'package:flutter/material.dart';

class ScaleFadeTransition extends StatelessWidget {
  final Animation<double> animation;
  final Widget child;

  const ScaleFadeTransition(
      {super.key, required this.animation, required this.child});

  @override
  Widget build(BuildContext context) {
    final Animation<double> scaleAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animation,
        curve: const Interval(0.0, 0.8, curve: Curves.easeOut),
      ),
    );
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return FadeTransition(
          opacity: scaleAnimation,
          child: ScaleTransition(
            scale: scaleAnimation,
            alignment: Alignment.topRight,
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}

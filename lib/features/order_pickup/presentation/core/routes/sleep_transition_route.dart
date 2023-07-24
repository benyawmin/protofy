import 'package:flutter/material.dart';

// Animated transition router
Route animatedTransitionRoute(Widget transitionWidget) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => transitionWidget,
    transitionDuration: const Duration(seconds: 1),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

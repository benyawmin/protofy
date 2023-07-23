import 'package:Goodbytz/features/order_pickup/presentation/pages/order_input_page.dart';
import 'package:flutter/material.dart';

// Animated sleep page to input order id page transition
Route sleepTransitionRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => OrderInputPage(),
    transitionDuration: const Duration(milliseconds: 500),
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

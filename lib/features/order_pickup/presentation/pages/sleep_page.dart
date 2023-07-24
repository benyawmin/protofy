import 'package:Goodbytz/features/order_pickup/presentation/core/routes/sleep_transition_route.dart';
import 'package:Goodbytz/features/order_pickup/presentation/pages/order_input_page.dart';
import 'package:flutter/material.dart';

// Sleep page when the application is waiting for the user tap
class SleepPage extends StatelessWidget {
  const SleepPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Navigator.of(context)
            .push(animatedTransitionRoute(const OrderInputPage())),
        child: Image.asset(
          'images/screen_sleep_image.png',
          fit: BoxFit.fill,
        ));
  }
}

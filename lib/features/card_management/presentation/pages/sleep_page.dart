import 'package:Goodbytz/features/card_management/presentation/core/routes/sleep_transition_route.dart';
import 'package:flutter/material.dart';

class SleepPage extends StatelessWidget {
  const SleepPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Navigator.of(context).push(sleepTransitionRoute()),
        child: Image.asset('images/screen_sleep_image.png', fit: BoxFit.fill,));
  }
}

// TODO: Change the fonts
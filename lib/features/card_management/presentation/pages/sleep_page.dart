import 'package:Goodbytz/features/card_management/presentation/core/routes/sleep_transition_route.dart';
import 'package:Goodbytz/features/card_management/presentation/pages/order_input_page.dart';
import 'package:Goodbytz/features/card_management/presentation/core/widgets/logo_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SleepPage extends StatelessWidget {
  const SleepPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(sleepTransitionRoute()),
      child: Scaffold(
        backgroundColor: Color(0xFF1D563E),
        body:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 40.h,
              ),
              Center(
                child: LogoText(
                  fontSize: 24.sp,
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Text(
                'Please tap on the screen to start',
                style: TextStyle(color: Color(0xFFDADADA)),
              )
            ],
          ),
      ),
    );
  }
}

// TODO: Change the fonts
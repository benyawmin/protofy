import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// Show the loading for app
class Loading extends StatelessWidget {
  const Loading({super.key});

  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: 50.w,
      child: Center(
        child: Image.asset(
          "images/food_loader.gif",
        ),
      ),
    );
  }
}

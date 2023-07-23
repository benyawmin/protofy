import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Loading extends StatelessWidget {
  
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

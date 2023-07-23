import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MiddleGridDivider extends StatelessWidget {
  const MiddleGridDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8.w,
      height: 18.h,
      decoration: BoxDecoration(
        color: Color(0xFFDADADA),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
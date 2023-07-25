import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// Middle grey containers between the two grids
class MiddleGridDivider extends StatelessWidget {
  const MiddleGridDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8.w,
      height: 18.h,
      decoration: BoxDecoration(
        color: const Color(0xFFC6C6C6),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

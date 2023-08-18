import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

//* Shows error if there was an error after the order input
class SaladListError extends StatelessWidget {
  final String message;
  const SaladListError({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 6.h,
        decoration: const BoxDecoration(
          color: Color(0xFFF9DEDC),
          borderRadius: BorderRadius.all(Radius.circular(18)),
        ),
        child: Center(
          child: Text(
            message,
            style: TextStyle(
                color: const Color(0xFF464A54),
                fontSize: 8.sp,
                fontWeight: FontWeight.w500),
          ),
        ));
  }
}

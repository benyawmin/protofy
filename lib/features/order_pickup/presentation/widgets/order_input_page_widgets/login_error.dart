import 'package:Goodbytz/features/order_pickup/presentation/widgets/order_input_page_widgets/order_main_body.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LoginError extends StatelessWidget {
  final String message;
  const LoginError({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        OrderMainBody(),
        Positioned(
          top: 20.h,
          left: 2.w,
          right: 2.w,
          child: Container(
              height: 6.h,
              decoration: const BoxDecoration(
                color: Color(0xFFF9DEDC),
                borderRadius: BorderRadius.all(Radius.circular(18)),
              ),
              child: Flexible(
                child: Center(
                  child: Text(
                    message,
                    style: TextStyle(
                        color: const Color(0xFF464A54),
                        fontFamily: 'Poppins',
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              )),
        ),
      ],
    );
  }
}
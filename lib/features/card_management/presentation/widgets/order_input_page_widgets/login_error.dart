import 'package:Goodbytz/features/card_management/presentation/widgets/order_input_page_widgets/pick_up_main_body.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LoginError extends StatelessWidget {
  final String message;
  const LoginError({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 20.h,
          child: Container(
            width: 100.w,
            height: 8.h,
            decoration: BoxDecoration(
              color: Color(0xFFF9DEDC),
              borderRadius: BorderRadius.all(Radius.circular(18)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                SizedBox(
                  width: 2.w,
                ),
                Icon(
                  Icons.error_outline,
                  color: Color(0xFFD93838),
                ),
                SizedBox(
                  width: 2.w,
                ),
                // TODO: Customize the error text based on the error
                Flexible(
                  child: Text(
                    '$message',
                    style: TextStyle(
                        color: Color(0xFF464A54),
                        fontFamily: 'Poppins',
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ]),
            ),
          ),
        ),
        PickupMainBody()
      ],
    );
  }
}

import 'package:clean_architecture_tdd_course/features/card_management/presentation/widgets/login_page_widgets/main_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LoginError extends StatelessWidget {
  const LoginError({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 100.w,
          height: 8.h,
          decoration: BoxDecoration(
            color: Color(0xFFF9DEDC),
            borderRadius:
                BorderRadius.all(Radius.circular(18)),
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
              Text(
                'Invalid email or password',
                style: TextStyle(
                    color: Color(0xFF464A54),
                    fontFamily: 'Poppins',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500),
              )
            ]),
          ),
        ),
        LoginMainBody()
      ],
    );
  }
}

import 'package:Enter/features/card_management/presentation/widgets/login_page_widgets/login_controls.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

class LoginMainBody extends StatelessWidget {
  const LoginMainBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 15.h,
        ),
        Text(
          'Coding Challenge',
          style: TextStyle(
              color: Color(0xFF181D29),
              fontFamily: 'Poppins',
              fontSize: 15.sp,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 2.h,
        ),
        Text(
          'Please enter your email and password',
          style: TextStyle(
              color: Color(0xFF181D29),
              fontFamily: 'Poppins',
              fontSize: 10.sp,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 20),
        // Bottom half
        LoginControls()
      ],
    );
  }
}

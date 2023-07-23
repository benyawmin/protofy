import 'package:Goodbytz/features/card_management/presentation/core/widgets/logo_text.dart';
import 'package:Goodbytz/features/card_management/presentation/widgets/order_input_page_widgets/login_controls.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OrderMainBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(fit: BoxFit.fill, 'images/top_banner.png'),
        SizedBox(
          height: 15.h,
        ),
        Padding(
          padding: EdgeInsets.all(2.h),
          child: Column(children: [
            LogoText(
              fontSize: 12.sp,
            ),
            SizedBox(
              height: 10.h,
            ),
            LoginControls()
          ]),
        ),
      ],
    );
  }
}
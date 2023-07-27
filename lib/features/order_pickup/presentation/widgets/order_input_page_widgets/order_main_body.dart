import 'package:Goodbytz/features/order_pickup/presentation/core/widgets/logo_text.dart';
import 'package:Goodbytz/features/order_pickup/presentation/core/widgets/slider_banner.dart';
import 'package:Goodbytz/features/order_pickup/presentation/widgets/order_input_page_widgets/order_input_controls.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OrderMainBody extends StatelessWidget {
  const OrderMainBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      
      children: [
        const SliderBanner(),
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
            const OrderControls()
          ]),
        ),
      ],
    );
  }
}

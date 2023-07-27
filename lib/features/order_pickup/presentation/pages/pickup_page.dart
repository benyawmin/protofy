import 'package:Goodbytz/features/order_pickup/domain/entities/order_data.dart';
import 'package:Goodbytz/features/order_pickup/presentation/core/helper/container_border.dart';
import 'package:Goodbytz/features/order_pickup/presentation/core/widgets/countdown.dart';
import 'package:Goodbytz/features/order_pickup/presentation/core/widgets/logo_text.dart';
import 'package:Goodbytz/features/order_pickup/presentation/core/widgets/slider_banner.dart';
import 'package:Goodbytz/features/order_pickup/presentation/widgets/pickup_page_widgets/order_id_label.dart';
import 'package:Goodbytz/features/order_pickup/presentation/widgets/pickup_page_widgets/pickup_page_widgets.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PickupPage extends StatefulWidget {
  final OrderData orderData;
  const PickupPage({super.key, required this.orderData});

  @override
  State<PickupPage> createState() => _PickupPageState();
}

class _PickupPageState extends State<PickupPage> {
  late OrderData pickupOrderData;

  @override
  void initState() {
    super.initState();
    pickupOrderData = widget.orderData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF5F5F7),
        body: Stack(
          children: [
            Positioned(
              right: 0,
              left: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF623B39).withOpacity(0.12),
                  borderRadius: containerRadius(),
                ),
                height: 55.h,
                width: 100.w,
              ),
            ),
            Column(
              children: [
                //*** Top banner ***//
                const SliderBanner(),
                SizedBox(
                  height: 15.h,
                ),

                //*** Logo Text ***//
                Padding(
                  padding: EdgeInsets.all(2.h),
                  child: Column(children: [
                    LogoText(
                      fontSize: 12.sp,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                  ]),
                ),

                //*** Countdown timer to pickup the order ***//
                CountDownTimer(
                    countDownTimerStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 8.sp,
                        fontWeight: FontWeight.bold),
                    secondsRemaining: 300,
                    whenTimeExpires: (() {
                      setState(() {
                        pickupOrderData.dishes = [];
                      });
                    })),

                //*** Blueprint of the pots ***//
                PickupBoxSystemBlueprint(pickupOrderData: pickupOrderData),

                // Add space
                SizedBox(
                  height: 8.h,
                ),

                //*** Showing the order ID ***//
                OrderIDLabel(pickupOrderData: pickupOrderData),

                // Add space
                const Spacer(),

                //*** Notification to take the food boxes ***//
                BottomNotification(
                  pickupOrderData: pickupOrderData,
                )
              ],
            ),
          ],
        ));
  }
}

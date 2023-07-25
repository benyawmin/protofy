import 'package:Goodbytz/features/order_pickup/domain/entities/order_data.dart';
import 'package:Goodbytz/features/order_pickup/presentation/bloc/order_pickup_bloc/order_pickup_bloc.dart';
import 'package:Goodbytz/features/order_pickup/presentation/core/helper/container_border.dart';
import 'package:Goodbytz/features/order_pickup/presentation/core/widgets/countdown.dart';
import 'package:Goodbytz/features/order_pickup/presentation/core/widgets/logo_text.dart';
import 'package:Goodbytz/features/order_pickup/presentation/core/widgets/slider_banner.dart';
import 'package:Goodbytz/features/order_pickup/presentation/widgets/pickup_page_widgets/bottom_notification.dart';
import 'package:Goodbytz/features/order_pickup/presentation/widgets/pickup_page_widgets/pots_blueprint.dart';
import 'package:Goodbytz/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        body: BlocProvider(
          create: (context) => sl<OrderPickupBloc>(),
          child: BlocBuilder<OrderPickupBloc, OrderPickupState>(
            builder: (context, state) {
              if (state is OrderPickupInitial) {
                return Stack(
                  children: [
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
                            countDownTimerStyle:
                                TextStyle(color: Colors.black, fontSize: 8.sp),
                            secondsRemaining: 10,
                            whenTimeExpires: (() {
                              setState(() {
                                pickupOrderData.dishes = [];
                              });
                            })),

                        //*** Blueprint of the pots ***//
                        PotsBlueprint(pickupOrderData: pickupOrderData),

                        // Add space
                        SizedBox(
                          height: 8.h,
                        ),

                        //*** Showing the order ID ***//
                        const Text(
                          'Order ID:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          pickupOrderData.orderID,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),

                        // Add space
                        const Spacer(),

                        //*** Notification to take the food boxes ***//
                        BottomNotification(
                          pickupOrderData: pickupOrderData,
                        )
                      ],
                    ),
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
                  ],
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ));
  }
}

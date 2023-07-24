import 'package:Goodbytz/features/order_pickup/domain/entities/order_data.dart';
import 'package:Goodbytz/features/order_pickup/presentation/bloc/order_pickup_bloc/order_pickup_bloc.dart';
import 'package:Goodbytz/features/order_pickup/presentation/core/widgets/logo_text.dart';
import 'package:Goodbytz/features/order_pickup/presentation/widgets/pickup_page_widgets/pickup_page_widgets.dart';
import 'package:Goodbytz/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class PickupPage extends StatelessWidget {
  final OrderData orderData;
  const PickupPage({super.key, required this.orderData});

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
                          ]),
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GridViewSection(
                                orderData: orderData,
                                section: 0,
                              ),
                              const MiddleGridDivider(),
                              SizedBox(
                                width: 2.w,
                              ),
                              const MiddleGridDivider(),
                              GridViewSection(
                                orderData: orderData,
                                section: 1,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        const Text(
                          'Order ID:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          'benyamin_jafari_2000',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: containerRadius(),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(2.h),
                            child: Text(
                              'Please take your order from the boxes: ${orderData.dishes.join(", ")}',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
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

  BorderRadius containerRadius() {
    return BorderRadius.only(
        topRight: Radius.circular(2.h),
        bottomRight: const Radius.circular(0),
        topLeft: Radius.circular(2.h),
        bottomLeft: const Radius.circular(0));
  }
}

import 'package:Goodbytz/features/card_management/domain/entities/order_data.dart';
import 'package:Goodbytz/features/card_management/presentation/bloc/order_pickup_bloc/order_pickup_bloc.dart';
import 'package:Goodbytz/features/card_management/presentation/core/widgets/blink_animation.dart';
import 'package:Goodbytz/features/card_management/presentation/core/widgets/logo_text.dart';
import 'package:Goodbytz/features/card_management/presentation/widgets/pickup_page_widgets/pickup_page_widgets.dart';
import 'package:Goodbytz/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class PickupPage extends StatelessWidget {
  final OrderData orderData;
  const PickupPage({required this.orderData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF5F5F7),
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
                              SizedBox(
                                width: 40.w,
                                height: 20.h,
                                child: GridView.count(
                                  mainAxisSpacing: 5,
                                  crossAxisSpacing: 5,
                                  crossAxisCount: 3,
                                  physics: NeverScrollableScrollPhysics(),
                                  children: List.generate(6, (index) {
                                    debugPrint(index.toString());
                                    debugPrint(orderData.dishes.toString());
                                    return Column(
                                      children: [
                                        (index < 3
                                                ? orderData.dishes
                                                    .contains(index)
                                                : orderData.dishes
                                                    .contains(index + 3))
                                            ? BlinkAnimation(
                                                child: Image.asset(
                                                    'icons/pot_green.png'))
                                            : Image.asset('icons/pot.png'),
                                        Text(
                                          index < 3
                                              ? index.toString()
                                              : (index + 3).toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    );
                                  }),
                                ),
                              ),
                              MiddleGridDivider(),
                              SizedBox(
                                width: 2.w,
                              ),
                              MiddleGridDivider(),
                              SizedBox(
                                width: 40.w,
                                height: 20.h,
                                child: GridView.count(
                                  mainAxisSpacing: 5,
                                  crossAxisSpacing: 5,
                                  crossAxisCount: 3,
                                  physics: NeverScrollableScrollPhysics(),
                                  children: List.generate(6, (index) {
                                    return Column(
                                      children: [
                                        (index < 3
                                                ? orderData.dishes
                                                    .contains(index + 3)
                                                : orderData.dishes
                                                    .contains(index + 6))
                                            ? BlinkAnimation(
                                                child: Image.asset(
                                                    'icons/pot_green.png'))
                                            : Image.asset('icons/pot.png'),
                                        Text(
                                          index < 3
                                              ? (3 + index).toString()
                                              : (6 + index).toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    );
                                  }),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Text('Order ID:'),
                        Text('benyamin_jafari_2000'),
                        Spacer(),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF1D563E),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(2.h),
                                bottomRight: Radius.circular(0),
                                topLeft: Radius.circular(2.h),
                                bottomLeft: Radius.circular(0)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(2.h),
                            child: Text(
                              'Please take your order from the boxes: ${orderData.dishes.join(", ")}',
                              style: TextStyle(color: Colors.white),
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
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(2.h),
                              bottomRight: Radius.circular(0),
                              topLeft: Radius.circular(2.h),
                              bottomLeft: Radius.circular(0)),
                        ),
                        height: 55.h,
                        width: 100.w,
                      ),
                    ),
                  ],
                );
              } else
                return SizedBox.shrink();
            },
          ),
        ));
  }
}

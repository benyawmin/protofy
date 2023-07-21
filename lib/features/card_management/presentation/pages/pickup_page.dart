import 'package:Goodbytz/features/card_management/domain/entities/order_data.dart';
import 'package:Goodbytz/features/card_management/presentation/bloc/order_pickup_bloc/order_pickup_bloc.dart';
import 'package:Goodbytz/features/card_management/presentation/core/widgets/logo_text.dart';
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
        backgroundColor: Color(0xFFF5F5F7),
        body: SingleChildScrollView(
            child: BlocProvider(
          create: (context) => sl<OrderPickupBloc>(),
          child: BlocBuilder<OrderPickupBloc, OrderPickupState>(
            builder: (context, state) {
              if (state is OrderPickupInitial) {
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
                              // Create a grid with 2 columns. If you change the scrollDirection to
                              // horizontal, this would produce 2 rows.
                              crossAxisCount: 3,
                              // Generate 100 Widgets that display their index in the List
                              children: List.generate(6, (index) {
                                return Column(
                                  children: [
                                    Image.asset('icons/pot.png'),
                                    Text(
                                      index.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                );
                              }),
                            ),
                          ),
                          Container(
                            width: 8.w,
                            height: 18.h,
                            decoration: BoxDecoration(
                              color: Color(0xFFDADADA),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          SizedBox(width: 2.w,),
                          Container(
                            width: 8.w,
                            height: 18.h,
                            decoration: BoxDecoration(
                              color: Color(0xFFDADADA),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          SizedBox(
                            width: 40.w,
                            height: 20.h,
                            child: GridView.count(
                              mainAxisSpacing: 5,
                              crossAxisSpacing: 5,
                              // Create a grid with 2 columns. If you change the scrollDirection to
                              // horizontal, this would produce 2 rows.
                              crossAxisCount: 3,
                              // Generate 100 Widgets that display their index in the List
                              children: List.generate(6, (index) {
                                return Column(
                                  children: [
                                    Image.asset('icons/pot.png'),
                                    Text(
                                      index.toString(),
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
                    )

                    // Center(
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       Column(
                    //         children: [
                    //           Row(
                    //             children: [
                    //               Column(
                    //                 children: [
                    //                   Image.asset('icons/pot.png'),
                    //                   Text(
                    //                     '0',
                    //                     style: TextStyle(
                    //                         fontWeight: FontWeight.bold),
                    //                   )
                    //                 ],
                    //               ),
                    //               SizedBox(
                    //                 width: 2.h,
                    //               ),
                    //               Column(
                    //                 children: [
                    //                   Image.asset('icons/pot.png'),
                    //                   Text(
                    //                     '1',
                    //                     style: TextStyle(
                    //                         fontWeight: FontWeight.bold),
                    //                   )
                    //                 ],
                    //               ),
                    //               SizedBox(
                    //                 width: 2.h,
                    //               ),
                    //               Column(
                    //                 children: [
                    //                   Image.asset('icons/pot.png'),
                    //                   Text(
                    //                     '2',
                    //                     style: TextStyle(
                    //                         fontWeight: FontWeight.bold),
                    //                   )
                    //                 ],
                    //               ),
                    //             ],
                    //           ),
                    //           SizedBox(
                    //             height: 7.h,
                    //           ),
                    //           Row(
                    //             children: [
                    //               Column(
                    //                 children: [
                    //                   Image.asset('icons/pot.png'),
                    //                   Text(
                    //                     '3',
                    //                     style: TextStyle(
                    //                         fontWeight: FontWeight.bold),
                    //                   )
                    //                 ],
                    //               ),
                    //               SizedBox(
                    //                 width: 2.h,
                    //               ),
                    //               Column(
                    //                 children: [
                    //                   Image.asset('icons/pot.png'),
                    //                   Text(
                    //                     '4',
                    //                     style: TextStyle(
                    //                         fontWeight: FontWeight.bold),
                    //                   )
                    //                 ],
                    //               ),
                    //               SizedBox(
                    //                 width: 2.h,
                    //               ),
                    //               Column(
                    //                 children: [
                    //                   Image.asset('icons/pot.png'),
                    //                   Text(
                    //                     '5',
                    //                     style: TextStyle(
                    //                         fontWeight: FontWeight.bold),
                    //                   )
                    //                 ],
                    //               ),
                    //             ],
                    //           ),
                    //         ],
                    //       ),
                    //       SizedBox(
                    //         width: 4.w,
                    //       ),
                    //       Row(
                    //         children: [
                    //           Container(
                    //             width: 8.w,
                    //             height: 24.h,
                    //             decoration: BoxDecoration(
                    //               color: Color(0xFFDADADA),
                    //               borderRadius: BorderRadius.circular(10),
                    //             ),
                    //           ),
                    //           SizedBox(
                    //             width: 2.h,
                    //           ),
                    //           Container(
                    //             width: 8.w,
                    //             height: 24.h,
                    //             decoration: BoxDecoration(
                    //               color: Color(0xFFDADADA),
                    //               borderRadius: BorderRadius.circular(10),
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //       SizedBox(
                    //         width: 4.w,
                    //       ),
                    //       Column(
                    //         children: [
                    //           Row(
                    //             children: [
                    //               Column(
                    //                 children: [
                    //                   Image.asset('icons/pot.png'),
                    //                   Text(
                    //                     '6',
                    //                     style: TextStyle(
                    //                         fontWeight: FontWeight.bold),
                    //                   )
                    //                 ],
                    //               ),
                    //               SizedBox(
                    //                 width: 2.h,
                    //               ),
                    //               Column(
                    //                 children: [
                    //                   Image.asset('icons/pot.png'),
                    //                   Text(
                    //                     '7',
                    //                     style: TextStyle(
                    //                         fontWeight: FontWeight.bold),
                    //                   )
                    //                 ],
                    //               ),
                    //               SizedBox(
                    //                 width: 2.h,
                    //               ),
                    //               Column(
                    //                 children: [
                    //                   Image.asset('icons/pot.png'),
                    //                   Text(
                    //                     '8',
                    //                     style: TextStyle(
                    //                         fontWeight: FontWeight.bold),
                    //                   )
                    //                 ],
                    //               ),
                    //             ],
                    //           ),
                    //           SizedBox(
                    //             height: 7.h,
                    //           ),
                    //           Row(
                    //             children: [
                    //               Column(
                    //                 children: [
                    //                   Image.asset('icons/pot.png'),
                    //                   Text(
                    //                     '9',
                    //                     style: TextStyle(
                    //                         fontWeight: FontWeight.bold),
                    //                   )
                    //                 ],
                    //               ),
                    //               SizedBox(
                    //                 width: 2.h,
                    //               ),
                    //               Column(
                    //                 children: [
                    //                   Image.asset('icons/pot.png'),
                    //                   Text(
                    //                     '10',
                    //                     style: TextStyle(
                    //                         fontWeight: FontWeight.bold),
                    //                   )
                    //                 ],
                    //               ),
                    //               SizedBox(
                    //                 width: 2.h,
                    //               ),
                    //               Column(
                    //                 children: [
                    //                   Image.asset('icons/pot.png'),
                    //                   Text(
                    //                     '11',
                    //                     style: TextStyle(
                    //                         fontWeight: FontWeight.bold),
                    //                   )
                    //                 ],
                    //               ),
                    //             ],
                    //           ),
                    //         ],
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                );
              }
              // return Text(
              //     '${orderData.orderId} ${orderData.dishes[0].boxNumber}');
              else
                return SizedBox.shrink();
            },
          ),
        )));
  }
}

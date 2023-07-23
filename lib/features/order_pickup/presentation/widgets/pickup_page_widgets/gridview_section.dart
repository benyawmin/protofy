import 'package:Goodbytz/features/order_pickup/domain/entities/order_data.dart';
import 'package:Goodbytz/features/order_pickup/presentation/core/helper/gridview_helper.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class GridViewSection extends StatelessWidget {
  final OrderData orderData;

  const GridViewSection({super.key, required this.orderData});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40.w,
      height: 20.h,
      child: GridView.count(
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        crossAxisCount: 3,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(6, (index) {
          debugPrint(index.toString());
          debugPrint(orderData.dishes.toString());
          return Column(children: logicBuilder(index, 0, orderData));
        }),
      ),
    );
  }
}

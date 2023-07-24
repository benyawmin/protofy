import 'package:Goodbytz/features/order_pickup/domain/entities/order_data.dart';
import 'package:Goodbytz/features/order_pickup/presentation/core/helper/gridview_helper.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class GridViewSection extends StatelessWidget {
  final OrderData orderData;
  final int section;

  const GridViewSection(
      {super.key, required this.orderData, required this.section});

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
          return Column(children: logicBuilder(index, section, orderData));
        }),
      ),
    );
  }
}

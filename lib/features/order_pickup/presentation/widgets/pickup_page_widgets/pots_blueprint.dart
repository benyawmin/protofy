import 'package:Goodbytz/features/order_pickup/domain/entities/order_data.dart';
import 'package:Goodbytz/features/order_pickup/presentation/widgets/pickup_page_widgets/gridview_section.dart';
import 'package:Goodbytz/features/order_pickup/presentation/widgets/pickup_page_widgets/middle_grid_divider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PotsBlueprint extends StatelessWidget {
  const PotsBlueprint({
    super.key,
    required this.pickupOrderData,
  });

  final OrderData pickupOrderData;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GridViewSection(
            orderData: pickupOrderData,
            section: 0,
          ),
          const MiddleGridDivider(),
          SizedBox(
            width: 2.w,
          ),
          const MiddleGridDivider(),
          GridViewSection(
            orderData: pickupOrderData,
            section: 1,
          )
        ],
      ),
    );
  }
}

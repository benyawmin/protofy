import 'package:Goodbytz/features/order_pickup/domain/entities/order_data.dart';
import 'package:Goodbytz/features/order_pickup/presentation/core/helper/container_border.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// Bottom notification of the screen which is the number of the boxes
// that have ready food or shows the time is over notification
class BottomNotification extends StatelessWidget {
  final OrderData pickupOrderData;
  const BottomNotification({super.key, required this.pickupOrderData});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: pickupOrderData.dishes.isNotEmpty
            ? Theme.of(context).primaryColor
            : const Color(0xFFFF5252).withOpacity(0.09),
        borderRadius: containerRadius(),
      ),
      child: Padding(
        padding: EdgeInsets.all(2.h),
        // If dishes is not empty show the box numbers,
        // otherwise the time to pickup the order is UP!
        child: pickupOrderData.dishes.isNotEmpty
            ? Text(
                'Please take your order from the boxes: ${pickupOrderData.dishes.join(", ")}',
                style: const TextStyle(color: Colors.white),
              )
            : Text(
                'Order pickup time is done!',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: pickupOrderData.dishes.isNotEmpty
                        ? Colors.white
                        : Colors.black),
              ),
      ),
    );
  }
}

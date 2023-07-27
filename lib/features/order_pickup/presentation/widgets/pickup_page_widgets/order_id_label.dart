import 'package:Goodbytz/features/order_pickup/domain/entities/order_data.dart';
import 'package:flutter/material.dart';

class OrderIDLabel extends StatelessWidget {
  final OrderData pickupOrderData;
  const OrderIDLabel({super.key, required this.pickupOrderData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Order ID:',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          pickupOrderData.orderID,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

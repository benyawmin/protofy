import 'package:Goodbytz/features/card_management/domain/entities/order_data.dart';
import 'package:Goodbytz/features/card_management/presentation/bloc/order_pickup_bloc/order_pickup_bloc.dart';
import 'package:Goodbytz/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PickupPage extends StatelessWidget {
  final OrderData orderData;
  const PickupPage({super.key, required this.orderData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: BlocProvider(
      create: (context) => sl<OrderPickupBloc>(),
      child: BlocBuilder<OrderPickupBloc, OrderPickupState>(
        builder: (context, state) {
          if (state is OrderPickupInitial)
            return Text(
                '${orderData.orderId} ${orderData.dishes[0].boxNumber}');
          else
            return SizedBox.shrink();
        },
      ),
    )));
  }
}

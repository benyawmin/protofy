import 'package:Goodbytz/features/order_pickup/presentation/bloc/order_input_bloc/order_input_bloc.dart';
import 'package:Goodbytz/features/order_pickup/presentation/pages/pickup_page.dart';
import 'package:Goodbytz/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Goodbytz/features/order_pickup/presentation/widgets/order_input_page_widgets/order_input_widgets.dart';

class OrderInputPage extends StatelessWidget {
  const OrderInputPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7),
      body: SingleChildScrollView(
        child: BlocProvider(
          create: (_) => sl<OrderInputBloc>(),
          child: Column(
            children: <Widget>[
              BlocBuilder<OrderInputBloc, OrderInputState>(
                builder: (context, state) {
                  //! Handling different pages and logics based on the state
                  //! emmited from the bloc
                  if (state is OrderIDAuthenticationInitial) {
                    return const OrderMainBody();
                  } else if (state is OrderIDAuthenticationInProgress) {
                    return const Stack(
                        alignment: Alignment.center,
                        children: [OrderMainBody(), Loading()]);
                  } else if (state is OrderIDAuthenticationSuccess) {
                    // Animated fade in transition to the next page
                    SchedulerBinding.instance.addPostFrameCallback((_) {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                            transitionsBuilder: (_, a, __, c) =>
                                FadeTransition(opacity: a, child: c),
                            transitionDuration: const Duration(seconds: 1),
                            pageBuilder: (_, __, ___) =>
                                PickupPage(orderData: state.orderData)),
                      );
                    });
                  } else if (state is OrderIDAuthenticationError) {
                    return OrderInputError(message: state.message);
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

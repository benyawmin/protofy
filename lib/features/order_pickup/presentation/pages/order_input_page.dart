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
          create: (_) => sl<LoginBloc>(),
          child: Column(
            children: <Widget>[
              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  if (state is AuthenticationInitial) {
                    return OrderMainBody();
                  } else if (state is AuthenticationInProgress) {
                    return Stack(
                        alignment: Alignment.center,
                        children: [OrderMainBody(), Loading()]);
                  } else if (state is AuthenticationSuccess) {
                    SchedulerBinding.instance.addPostFrameCallback((_) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) =>
                              PickupPage(orderData: state.orderData),
                        ),
                      );
                    });
                  } else if (state is AuthenticationError) {
                    return LoginError(message: state.message);
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

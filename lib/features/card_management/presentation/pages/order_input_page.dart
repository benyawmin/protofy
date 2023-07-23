import 'package:Goodbytz/features/card_management/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:Goodbytz/features/card_management/presentation/pages/pickup_page.dart';
import 'package:Goodbytz/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Goodbytz/features/card_management/presentation/widgets/order_input_page_widgets/order_input_widgets.dart';

class OrderInputPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F7),
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
                    //! Different types of erros are handled inside logic but
                    //! according to design the same error will be shown

                    return LoginError(message: state.message);
                  }
                  return SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

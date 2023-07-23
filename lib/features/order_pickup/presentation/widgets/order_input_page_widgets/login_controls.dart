import 'package:Goodbytz/features/order_pickup/presentation/bloc/order_input_bloc/order_input_bloc.dart';
import 'package:Goodbytz/features/order_pickup/presentation/widgets/order_input_page_widgets/order_id_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class LoginControls extends StatefulWidget {
  const LoginControls({super.key});


  @override
  LoginControlsState createState() => LoginControlsState();
}

class LoginControlsState extends State<LoginControls> {
  final orderIdTextController = TextEditingController();
  late final Function(String) onOrderIdTextChanged;
  late String orderId = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 8.h,
          child: OrderIdTextField(
              orderIdTextController: orderIdTextController,
              onOrderIdTextChanged: (value) {
                setState(() {
                  orderId = value;
                });
              }),
        ),
        SizedBox(
          height: 4.h,
        ),
        SizedBox(height: 20.h),
        ValueListenableBuilder<TextEditingValue>(
          valueListenable: orderIdTextController,
          builder: (context, value, child) {
            return SizedBox(
              width: 100.w,
              height: 8.h,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      backgroundColor: const Color(0xFF1E5229),
                      disabledForegroundColor: const Color(0xFFE1E1E4)),
                  onPressed: orderIdTextController.text.isNotEmpty
                      ? () {
                          dispatchAuth();
                        }
                      : null,
                  child: const Text(
                    'Pick up order',
                    style: TextStyle(color: Color(0xFFF5F5F7)),
                  )),
            );
          },
        ),
      ],
    );
  }

  void dispatchAuth() {
    orderIdTextController.clear();
    BlocProvider.of<LoginBloc>(context)
        .add(AuthenticationRequest(orderId: orderId));
  }

  @override
  void dispose() {
    orderIdTextController.dispose();
    super.dispose();
  }
}
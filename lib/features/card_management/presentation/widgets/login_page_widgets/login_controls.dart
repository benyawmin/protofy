import 'package:Enter/features/card_management/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:Enter/features/card_management/presentation/widgets/login_page_widgets/email_text_field.dart';
import 'package:Enter/features/card_management/presentation/widgets/login_page_widgets/password_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class LoginControls extends StatefulWidget {
  const LoginControls({
    Key? key,
  }) : super(key: key);

  @override
  _LoginControlsState createState() => _LoginControlsState();
}

class _LoginControlsState extends State<LoginControls> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late final Function(String) onEmailChanged;
  late final Function(String) onPasswordChanged;
  late String email = '';
  late String password = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        EmailTextField(
            emailController: emailController,
            onEmailChanged: (value) {
              setState(() {
                email = value;
              });
            }),
        SizedBox(
          height: 4.h,
        ),
        PasswordTextField(
            passwordController: passwordController,
            onPasswordChanged: (value) {
              setState(() {
                password = value;
              });
            }),
        SizedBox(height: 20.h),
        ValueListenableBuilder<TextEditingValue>(
          valueListenable: emailController,
          builder: (context, value, child) {
            return ValueListenableBuilder<TextEditingValue>(
                valueListenable: passwordController,
                builder: (context, value, child) {
                  return SizedBox(
                    width: 100.w,
                    height: 8.h,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            backgroundColor: Color(0xFF181D29),
                            disabledForegroundColor: Color(0xFFE1E1E4)),
                        child: Text(
                          'Login',
                          style: TextStyle(color: Color(0xFFF5F5F7)),
                        ),
                        onPressed: emailController.text.isNotEmpty &&
                                passwordController.text.isNotEmpty
                            ? () {
                                dispatchAuth();
                              }
                            : null),
                  );
                });
          },
        ),
      ],
    );
  }

  void dispatchAuth() {
    emailController.clear();
    passwordController.clear();
    BlocProvider.of<LoginBloc>(context)
        .add(AuthenticationRequest(email: email, password: password));
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}

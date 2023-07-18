import 'package:clean_architecture_tdd_course/features/card_management/presentation/bloc/login_bloc/login_bloc.dart';
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
  // TODO
  // Remove the default values
  final emailController = TextEditingController(text: 'benyamin@email.com');
  final passwordController =
      TextEditingController(text: 'pasd3q21esE#QD123ewdasDA');
  // late
  String email = 'benyamin@email.com';
  // late
  String password = 'pasd3q21esE#QD123ewdasDA';
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: emailController,
          decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xFFFFFFFF),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFA3A5A9), width: 1),
                borderRadius: BorderRadius.circular(18),
              ),
              hintText: 'Email',
              hintStyle: TextStyle(color: Color(0xFF74777F))),
          onChanged: (value) {
            email = value;
          },
        ),
        SizedBox(
          height: 4.h,
        ),
        TextField(
          controller: passwordController,
          obscureText: !_passwordVisible,
          decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: _passwordVisible
                    ? Icon(
                        Icons.visibility_outlined,
                        color: Color(0xFF74777F),
                      )
                    : Icon(
                        Icons.visibility_off_outlined,
                        color: Color(0xFF74777F),
                      ),
                onPressed: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
              ),
              filled: true,
              fillColor: Color(0xFFFFFFFF),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFA3A5A9), width: 1),
                borderRadius: BorderRadius.circular(18),
              ),
              hintText: 'Passwort',
              hintStyle: TextStyle(color: Color(0xFF74777F))),
          onChanged: (value) {
            password = value;
          },
        ),
        SizedBox(height: 20.h),
        ValueListenableBuilder<TextEditingValue>(
          valueListenable: emailController,
          builder: (context, value, child) {
            return ValueListenableBuilder<TextEditingValue>(
                valueListenable: passwordController,
                builder: (context, value, child) {
                  return emailController.text.isNotEmpty &&
                          passwordController.text.isNotEmpty
                      ? SizedBox(
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
                              onPressed: () {
                                dispatchAuth();
                              }),
                        )
                      : SizedBox(
                          width: 100.w,
                          height: 8.h,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  disabledForegroundColor: Color(0xFFE1E1E4)),
                              child: Text(
                                'Login',
                                style: TextStyle(color: Color(0xFFA3A5A9)),
                              ),
                              onPressed: null),
                        );
                });
          },
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
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

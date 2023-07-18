import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController passwordController;
  final Function(String) onPasswordChanged;

  const PasswordTextField(
      {super.key,
      required this.passwordController,
      required this.onPasswordChanged});

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.passwordController,
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
      onChanged: widget.onPasswordChanged
    );
  }
}

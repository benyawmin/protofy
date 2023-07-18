import 'package:flutter/material.dart';

class EmailTextField extends StatefulWidget {
  final TextEditingController emailController;
  final Function(String) onEmailChanged;

  const EmailTextField(
      {super.key, required this.emailController, required this.onEmailChanged});

  @override
  State<EmailTextField> createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.emailController,
      decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xFFFFFFFF),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFA3A5A9), width: 1),
            borderRadius: BorderRadius.circular(18),
          ),
          hintText: 'Email',
          hintStyle: TextStyle(color: Color(0xFF74777F))),
      onChanged: widget.onEmailChanged
    );
  }
}

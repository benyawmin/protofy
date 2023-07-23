import 'package:flutter/material.dart';

class OrderIdTextField extends StatefulWidget {
  final TextEditingController orderIdTextController;
  final Function(String) onOrderIdTextChanged;

  const OrderIdTextField(
      {required this.orderIdTextController,
      required this.onOrderIdTextChanged});

  @override
  State<OrderIdTextField> createState() => _OrderIdTextFieldState();
}

class _OrderIdTextFieldState extends State<OrderIdTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: widget.orderIdTextController,
        decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xFFFFFFFF),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF1E5229), width: 1),
              borderRadius: BorderRadius.circular(18),
            ),
            hintText: 'Order ID',
            hintStyle: TextStyle(color: Color(0xFF74777F))),
        onChanged: widget.onOrderIdTextChanged);
  }
}

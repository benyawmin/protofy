import 'package:flutter/material.dart';

// Order ID text field
class OrderIdTextField extends StatefulWidget {
  final TextEditingController orderIdTextController;
  final Function(String) onOrderIdTextChanged;

  const OrderIdTextField(
      {super.key,
      required this.orderIdTextController,
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
            labelText: 'Order ID',
            filled: true,
            fillColor: const Color(0xFFFFFFFF),
            border: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).primaryColor, width: 1),
              borderRadius: BorderRadius.circular(18),
            ),
            hintStyle: const TextStyle(color: Color(0xFF74777F))),
        onChanged: widget.onOrderIdTextChanged);
  }
}
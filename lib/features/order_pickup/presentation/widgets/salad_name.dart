import 'package:flutter/material.dart';
import 'package:protofy/features/order_pickup/data/models/stadt_salat_model.dart';

class SaladName extends StatelessWidget {
  const SaladName({
    super.key,
    required this.saladCatList,
    required this.index,
    required this.fontSize,
  });

  final List<Product> saladCatList;
  final int index;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        saladCatList[index].name,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize),
      ),
    );
  }
}

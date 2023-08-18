import 'package:flutter/material.dart';
import 'package:protofy/features/order_pickup/data/models/stadt_salat_model.dart';

class SaladPrice extends StatelessWidget {
  final List<Product> saladCatList;
  final int index;
  final double fontSize;

  const SaladPrice(
      {super.key,
      required this.saladCatList,
      required this.index,
      required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize),
          '${saladCatList[index].price.withVat}€'),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SaladPrice extends StatelessWidget {
  final List saladCatList;
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
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize.sp),
          '${saladCatList[index]['price']['withVat']}€'),
    );
  }
}

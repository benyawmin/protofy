import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SaladName extends StatelessWidget {
  const SaladName({
    super.key,
    required this.saladCatList,
    required this.index,
    required this.fontSize,
  });

  final List saladCatList;
  final int index;
  final int fontSize;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        saladCatList[index]['name'],
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize.sp),
      ),
    );
  }
}

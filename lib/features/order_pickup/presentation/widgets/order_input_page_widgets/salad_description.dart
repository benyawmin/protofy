import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class SaladDescription extends StatelessWidget {
  final List saladCatList;
  final int index;
  final int fontSize;

  const SaladDescription(
      {super.key, required this.saladCatList, required this.index, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: SingleChildScrollView(
        child: Text(
          saladCatList[index]['description'].toString(),
          style: GoogleFonts.openSans(fontSize: fontSize.sp),
          overflow: TextOverflow.clip,
        ),
      ),
    );
  }
}
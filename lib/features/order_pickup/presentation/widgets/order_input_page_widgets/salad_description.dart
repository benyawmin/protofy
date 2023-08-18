import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:protofy/features/order_pickup/data/models/stadt_salat_model.dart';

class SaladDescription extends StatelessWidget {
  final List<Product> saladCatList;
  final int index;
  final double fontSize;

  const SaladDescription(
      {super.key,
      required this.saladCatList,
      required this.index,
      required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: SingleChildScrollView(
        child: Text(
          utf8.decode(saladCatList[index].description.codeUnits),
          style: GoogleFonts.openSans(fontSize: fontSize),
          overflow: TextOverflow.clip,
        ),
      ),
    );
  }
}

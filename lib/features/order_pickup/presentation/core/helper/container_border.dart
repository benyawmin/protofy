  // Rounded Container shape radius builder
  import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

BorderRadius containerRadius() {
    return BorderRadius.only(
        topRight: Radius.circular(2.h),
        bottomRight: const Radius.circular(0),
        topLeft: Radius.circular(2.h),
        bottomLeft: const Radius.circular(0));
  }
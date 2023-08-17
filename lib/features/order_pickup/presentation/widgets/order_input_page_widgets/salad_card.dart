import 'package:flutter/material.dart';
import 'package:protofy/features/order_pickup/presentation/widgets/order_input_page_widgets/salad_description.dart';
import 'package:protofy/features/order_pickup/presentation/widgets/order_input_page_widgets/salad_image.dart';
import 'package:protofy/features/order_pickup/presentation/widgets/order_input_page_widgets/salad_name.dart';
import 'package:protofy/features/order_pickup/presentation/widgets/order_input_page_widgets/salad_price.dart';
import 'package:sizer/sizer.dart';

class SaladCard extends StatelessWidget {
  final int index;
  final List saladCatList;
  const SaladCard({super.key, required this.index, required this.saladCatList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.h),
      child: Column(
        children: [
          //****** Image ******/
          Expanded(
            child: SaladImage(saladCatList: saladCatList, index: index),
          ),

          //****** Name ******/
          SizedBox(
            width: 20.w,
            child: SaladName(
                saladCatList: saladCatList, index: index, fontSize: 8),
          ),
          SizedBox(
            height: 1.h,
          ),

          //****** Description ******/
          Expanded(
            child: SizedBox(
                width: 20.w,
                child: SaladDescription(
                  saladCatList: saladCatList,
                  index: index,
                  fontSize: 6,
                )),
          ),
          SizedBox(
            height: 1.h,
          ),

          //****** Price ******/
          SizedBox(
            width: 20.w,
            child: SaladPrice(
              saladCatList: saladCatList,
              index: index,
              fontSize: 8,
            ),
          ),
          // flutter run -d chrome --web-renderer html
        ],
      ),
    );
  }
}

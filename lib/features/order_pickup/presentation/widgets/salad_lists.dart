import 'package:flutter/material.dart';
import 'package:protofy/features/order_pickup/data/models/stadt_salat_model.dart';
import 'package:protofy/features/order_pickup/presentation/widgets/salad_list_widgets.dart';
import 'package:sizer/sizer.dart';

class SaladListScreen extends StatelessWidget {
  final int index;
  final List<Product> saladCatList;
  const SaladListScreen(
      {super.key, required this.index, required this.saladCatList});

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
                saladCatList: saladCatList, index: index, fontSize: 14),
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
                  fontSize: 12,
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
              fontSize: 14,
            ),
          ),
          // flutter run -d chrome --web-renderer html
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:protofy/features/order_pickup/data/models/stadt_salat_model.dart';
import 'package:protofy/features/order_pickup/presentation/widgets/order_input_page_widgets/salad_description.dart';
import 'package:protofy/features/order_pickup/presentation/widgets/order_input_page_widgets/salad_image.dart';
import 'package:protofy/features/order_pickup/presentation/widgets/order_input_page_widgets/salad_name.dart';
import 'package:protofy/features/order_pickup/presentation/widgets/order_input_page_widgets/salad_price.dart';
import 'package:sizer/sizer.dart';

class Details extends StatelessWidget {
  final List<Product> saladCatList;
  final int index;

  const Details({super.key, required this.saladCatList, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(2.h),
        child: Column(
          children: [
            //****** Image ******/
            SizedBox(
                width: 50.w,
                height: 50.h,
                child: SaladImage(
                  saladCatList: saladCatList,
                  index: index,
                )),

            SizedBox(
              height: 1.h,
            ),

            //****** Name ******/
            SaladName(saladCatList: saladCatList, index: index, fontSize: 16,),

            SizedBox(
              height: 1.h,
            ),

            //****** Description ******/
            SaladDescription(
                saladCatList: saladCatList, index: index, fontSize: 14),
            SizedBox(
              height: 1.h,
            ),
            //****** Price ******/
            SaladPrice(saladCatList: saladCatList, index: index, fontSize: 16)
            // flutter run -d chrome --web-renderer html
          ],
        ),
      ),
    );
  }
}

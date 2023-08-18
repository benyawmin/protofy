import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:protofy/features/order_pickup/data/models/stadt_salat_model.dart';
import 'package:protofy/features/order_pickup/presentation/pages/details_page.dart';
import 'package:protofy/features/order_pickup/presentation/widgets/order_input_page_widgets/salad_lists.dart';
import 'package:sizer/sizer.dart';

class SaladCategoryList extends StatelessWidget {
  final List<Product> saladCatList;
  final String title;
  const SaladCategoryList(
      {super.key, required this.saladCatList, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              )),
          Expanded(
            child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(saladCatList.length, (index) {
                  return Row(
                    children: [
                      OpenContainer(
                        transitionDuration: const Duration(milliseconds: 500),
                        closedBuilder: (context, action) => SaladListScreen(
                          saladCatList: saladCatList,
                          index: index,
                        ),
                        openBuilder: (context, action) => Details(
                          saladCatList: saladCatList,
                          index: index,
                        ),
                      ),
                      SizedBox(
                        width: 4.w,
                      )
                    ],
                  );
                })),
          ),
        ],
      ),
    );
  }
}

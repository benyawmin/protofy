import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:protofy/features/order_pickup/presentation/widgets/details.dart';
import 'package:protofy/features/order_pickup/presentation/widgets/order_input_page_widgets/salad_card.dart';
import 'package:sizer/sizer.dart';

class SaladCategoryList extends StatelessWidget {
  final List<dynamic> saladCatList;
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
                style: const TextStyle(fontWeight: FontWeight.bold),
              )),
          Expanded(
            child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(saladCatList.length, (index) {
                  return Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration: const Duration(seconds: 4),
                            pageBuilder: (_, __, ___) => Hero(
                              tag: '$index',
                              child: Details(
                                saladCatList: saladCatList,
                                index: index,
                              ),
                            ),
                          ),
                        ),
                        child: Hero(
                          tag: '$index',
                          child: SaladCard(
                            saladCatList: saladCatList,
                            index: index,
                          ),
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

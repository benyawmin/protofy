import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class SaladCategoryList extends StatelessWidget {
  List<dynamic> saladCatList;
  String title;
  SaladCategoryList(
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
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(2.h),
                          child: Column(
                            children: [
                              Expanded(
                                child: Image.network(
                                  'https://static.stadtsalat.de/shop/image/${saladCatList[index]['image']}',
                                ),
                              ),
                              SizedBox(
                                width: 20.w,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    saladCatList[index]['name'],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Expanded(
                                child: SizedBox(
                                  width: 20.w,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      saladCatList[index]['description']
                                          .toString(),
                                      style: GoogleFonts.openSans(fontSize: 10),
                                      overflow: TextOverflow.clip,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              SizedBox(
                                width: 20.w,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                      '${saladCatList[index]['price']['withVat']}€'),
                                ),
                              ),
                              // flutter run -d chrome --web-renderer html
                            ],
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

import 'package:flutter/material.dart';
import 'package:protofy/features/order_pickup/data/models/stadt_salat_model.dart';
import 'package:protofy/features/order_pickup/presentation/widgets/salad_category_list.dart';
import 'package:sizer/sizer.dart';

class SaladList extends StatefulWidget {
  final List<Product> saladList;
  const SaladList({super.key, required this.saladList});

  @override
  State<SaladList> createState() => _SaladListState();
}

class _SaladListState extends State<SaladList> {
  List<Product> noMeats = [];
  List<Product> meats = [];
  List<Product> sides = [];
  List<Product> deserts = [];
  List<Product> popular = [];
  List<Product> drinks = [];
  @override
  void initState() {
    super.initState();
    categorizing();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7),
      body: Padding(
        padding: EdgeInsets.all(2.h),
        child: ListView(
          children: [
            SaladCategoryList(saladCatList: popular, title: 'POPULAR'),
            SaladCategoryList(
                saladCatList: noMeats, title: 'PLANT-BASED & CHEESE'),
            SaladCategoryList(saladCatList: meats, title: 'MEAT'),
            SaladCategoryList(saladCatList: sides, title: 'SIDES'),
            SaladCategoryList(saladCatList: deserts, title: 'DESSERTS'),
            SaladCategoryList(saladCatList: drinks, title: 'GETRÄNKE'),
          ],
        ),
      ),
    );
  }

  categorizing() {
// Define a map to store categories and their corresponding lists
    var categoryMap = {
      'category.nomeat': noMeats,
      'category.meat': meats,
      'category.drink': drinks,
      'category.top-seller': popular,
      'category.dessert': deserts,
      'category.side': sides,
    };

    for (var orderItem in widget.saladList) {
      for (var categoryTag in categoryMap.keys) {
        if (orderItem.tags.contains(categoryTag)) {
          categoryMap[categoryTag]!.add(orderItem);
          break; // Break the loop once the category is found
        }
      }
    }
  }
}

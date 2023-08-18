import 'package:flutter/material.dart';
import 'package:protofy/features/order_pickup/data/models/stadt_salat_model.dart';
import 'package:protofy/features/order_pickup/presentation/widgets/order_input_page_widgets/salad_category_list.dart';
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
    for (var orderItem in widget.saladList) {
      if (orderItem.tags.contains('category.nomeat')) {
        noMeats.add(orderItem);
      } else if (orderItem.tags.contains('category.meat')) {
        meats.add(orderItem);
      } else if (orderItem.tags.contains('category.drink')) {
        drinks.add(orderItem);
      } else if (orderItem.tags.contains('category.top-seller')) {
        popular.add(orderItem);
      } else if (orderItem.tags.contains('category.dessert')) {
        deserts.add(orderItem);
      } else if (orderItem.tags.contains('category.side')) {
        sides.add(orderItem);
      }
    }
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
}

import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: Image.asset(
          "images/food_loader.gif",
          height: 125.0,
          width: 125.0,
        ),
      ),
    );
  }
}

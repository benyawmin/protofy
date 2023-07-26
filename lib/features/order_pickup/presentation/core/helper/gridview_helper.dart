import 'package:Goodbytz/features/order_pickup/domain/entities/order_data.dart';
import 'package:Goodbytz/features/order_pickup/presentation/core/widgets/blink_animation.dart';
import 'package:flutter/material.dart';

// Choosing which pot icons should be blinking (meaning which boxes have
//ready food in them)
List<Widget> griviewUILogicBuilder(
    int index, int section, OrderData orderData) {
  List<Widget> lb = [];
  // show blinking green pot when the food is ready
  Widget blinkingPot = Expanded(
      child: BlinkAnimation(child: Image.asset('icons/pot_green.png')));
  // show normal pot when the food is not ready
  Widget potImage = Expanded(child: Image.asset('icons/pot.png'));
  // grid view is divided into two section [0, 1] we build UI based on that
  int baseIndex = section == 0 ? 0 : 3;

  // Since we have 2 separate gridview we should add numbers based on
  // the list generator index, otherwise the pot numbers will be like this:

  /*
  0 1 2   6 7 8
  3 4 5   9 10 11
  */

  // Which is not we want, What we want is this:

  /*
  0 1 2   3 4 5
  6 7 8   9 10 11
  */

  // We put this condition to acheive that
  if (index < 3) {
    if (orderData.dishes.contains(baseIndex + index)) {
      lb.add(blinkingPot);
    } else {
      lb.add(potImage);
    }

    lb.add(Text((baseIndex + index).toString(),
        style: const TextStyle(fontWeight: FontWeight.bold)));
  } else {
    if (orderData.dishes.contains(baseIndex + index + 3)) {
      lb.add(blinkingPot);
    } else {
      lb.add(potImage);
    }

    lb.add(Text((baseIndex + index + 3).toString(),
        style: const TextStyle(fontWeight: FontWeight.bold)));
  }

  return lb;
}

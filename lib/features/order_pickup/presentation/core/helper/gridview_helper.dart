import 'package:Goodbytz/features/order_pickup/domain/entities/order_data.dart';
import 'package:Goodbytz/features/order_pickup/presentation/core/widgets/blink_animation.dart';
import 'package:flutter/material.dart';

// Choosing which pot icons should be blinking (meaning which boxes have
//ready food in them)
List<Widget> logicBuilder(int index, int section, OrderData orderData) {
  List<Widget> lb = [];
  // show green pot when the food is ready
  Widget blinkingPot =
      BlinkAnimation(child: Image.asset('icons/pot_green.png'));
  // show black pot when the food is not ready
  Widget potImage = Image.asset('icons/pot.png');
  // grid view is divided into two section [0, 1] we build UI based on that
  int baseIndex = section == 0 ? 0 : 3;

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

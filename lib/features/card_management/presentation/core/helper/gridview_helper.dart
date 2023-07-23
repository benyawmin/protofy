  import 'package:Goodbytz/features/card_management/domain/entities/order_data.dart';
import 'package:Goodbytz/features/card_management/presentation/core/widgets/blink_animation.dart';
import 'package:flutter/material.dart';

List<Widget> logicBuilder(int index, int section, OrderData orderData) {
    List<Widget> lb = [];
    Widget blinkingPot =
        BlinkAnimation(child: Image.asset('icons/pot_green.png'));
    Widget potImage = Image.asset('icons/pot.png');
    int baseIndex = section == 0 ? 0 : 3;

    if (index < 3) {
      if (orderData.dishes.contains(baseIndex + index))
        lb.add(blinkingPot);
      else
        lb.add(potImage);

      lb.add(Text((baseIndex + index).toString(),
          style: TextStyle(fontWeight: FontWeight.bold)));
    } else {
      if (orderData.dishes.contains(baseIndex + index + 3))
        lb.add(blinkingPot);
      else
        lb.add(potImage);

      lb.add(Text((baseIndex + index + 3).toString(),
          style: TextStyle(fontWeight: FontWeight.bold)));
    }

    return lb;
  }
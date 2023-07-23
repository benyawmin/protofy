import 'package:Goodbytz/features/order_pickup/presentation/core/helper/gridview_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:Goodbytz/features/order_pickup/domain/entities/order_data.dart';
import 'package:Goodbytz/features/order_pickup/presentation/core/widgets/blink_animation.dart';

void main() {
  test('logicBuilder', () {
    // Create a sample OrderData object with some dishes
    OrderData orderData =
        const OrderData(dishes: [0, 2, 6], orderId: 'benyamin_jafari_2000');

    // Test section 0
    List<Widget> resultSection0 = logicBuilder(0, 0, orderData);
    // Check if there are two widgets in the result list
    expect(resultSection0.length, 2);
    // Check if the first widget is BlinkAnimation
    expect(resultSection0[0], isInstanceOf<BlinkAnimation>());
    // Check if the second widget is Text
    expect(resultSection0[1], isInstanceOf<Text>());

    // Test section 1
    List<Widget> resultSection1 = logicBuilder(4, 1, orderData);
    expect(resultSection1.length, 2);
    expect(resultSection1[0], isInstanceOf<Image>());
    expect(resultSection1[1], isInstanceOf<Text>());
  });
}

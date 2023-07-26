import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:Goodbytz/features/order_pickup/domain/entities/order_data.dart';
import 'package:Goodbytz/features/order_pickup/presentation/core/helper/gridview_helper.dart';
import 'package:Goodbytz/features/order_pickup/presentation/core/widgets/blink_animation.dart';

void main() {
  test('logicBuilder', () {
    // Create a sample OrderData object with some dishes
    OrderData orderData =
        OrderData(dishes: const [0, 2, 6], orderID: 'haritha_kumar_2000');

    // Test section 0
    List<Widget> resultSection0 = griviewUILogicBuilder(0, 0, orderData);
    // Check if there are two widgets in the result list
    expect(resultSection0.length, 2);

    // Check if the first widget is an Expanded widget
    expect(resultSection0[0], isA<Expanded>());
    // Get the child of the Expanded widget and check if it's a BlinkAnimation widget
    expect((resultSection0[0] as Expanded).child, isA<BlinkAnimation>());

    // Check if the second widget is a Text widget
    expect(resultSection0[1], isA<Text>());

    // Test section 1
    List<Widget> resultSection1 = griviewUILogicBuilder(4, 1, orderData);
    expect(resultSection1.length, 2);
    expect(resultSection1[0], isA<Expanded>());
    expect((resultSection1[0] as Expanded).child, isA<Image>());
    expect(resultSection1[1], isA<Text>());
  });
}

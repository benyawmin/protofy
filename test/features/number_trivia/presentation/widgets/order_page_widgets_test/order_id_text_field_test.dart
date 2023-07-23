import 'package:Goodbytz/features/order_pickup/presentation/widgets/order_input_page_widgets/order_id_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('EmailTextField', () {
    late TextEditingController orderIdController;
    late String changeOrderID;

    setUp(() {
      orderIdController = TextEditingController();
      changeOrderID = '';
    });

    testWidgets('should update the email when there is a text inside',
        (WidgetTester tester) async {
      void onEmailChanged(String orderID) {
        changeOrderID = orderID;
      }

      final widget = OrderIdTextField(
        orderIdTextController: orderIdController,
        onOrderIdTextChanged: onEmailChanged,
      );

      await tester.pumpWidget(MaterialApp(home: Scaffold(body: widget)));

      // should enter text into the widget
      await tester.enterText(find.byType(TextField), 'benyamin_jafari_2000');

      // should have correct text with controller
      expect(orderIdController.text, 'benyamin_jafari_2000');

      // should call onEmailChanged callback with the correct email
      expect(changeOrderID, 'benyamin_jafari_2000');
    });
  });
}

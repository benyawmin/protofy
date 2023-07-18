import 'package:Enter/features/card_management/presentation/widgets/login_page_widgets/email_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('EmailTextField', () {
    late TextEditingController emailController;
    late String changedEmail;

    setUp(() {
      emailController = TextEditingController();
      changedEmail = '';
    });

    testWidgets('should update the email when there is a text inside',
        (WidgetTester tester) async {
      void onEmailChanged(String email) {
        changedEmail = email;
      }

      final widget = EmailTextField(
        emailController: emailController,
        onEmailChanged: onEmailChanged,
      );

      await tester.pumpWidget(MaterialApp(home: Scaffold(body: widget)));

      // should enter text into the widget
      await tester.enterText(find.byType(TextField), 'benyamin@email.com');

      // should have correct text with controller
      expect(emailController.text, 'benyamin@email.com');

      // should call onEmailChanged callback with the correct email
      expect(changedEmail, 'benyamin@email.com');
    });
  });
}

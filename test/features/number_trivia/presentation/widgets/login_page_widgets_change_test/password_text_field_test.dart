import 'package:Enter/features/card_management/presentation/widgets/login_page_widgets/password_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('EmailTextField', () {
    late TextEditingController passwordController;
    late String changePassword;

    setUp(() {
      passwordController = TextEditingController();
      changePassword = '';
    });

    testWidgets('should update the password when there is a text inside',
        (WidgetTester tester) async {
      // Define the function to be called when the password is changed
      void onEmailChanged(String password) {
        changePassword = password;
      }

      final widget = PasswordTextField(
        passwordController: passwordController,
        onPasswordChanged: onEmailChanged,
      );

      await tester.pumpWidget(MaterialApp(home: Scaffold(body: widget)));

      // should enter text into the widget
      await tester.enterText(find.byType(TextField), 'saD!@#E412wem');

      // should have correct text with controller
      expect(passwordController.text, 'saD!@#E412wem');

      // should call onPasswordChanged callback with the correct password
      expect(changePassword, 'saD!@#E412wem');
    });
  });
}

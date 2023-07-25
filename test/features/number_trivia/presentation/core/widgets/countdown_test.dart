import 'package:Goodbytz/features/order_pickup/presentation/core/widgets/countdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CountDownTimer displays correct time',
      (WidgetTester tester) async {
    // Define the initial time in seconds and the expected formatted time.
    const int initialSeconds = 100;
    const String expectedFormattedTime = '01:40';

    // Build our widget and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: CountDownTimer(
          secondsRemaining: initialSeconds,
          whenTimeExpires: () {},
        ),
      ),
    );

    // Verify that the CountDownTimer displays the correct initial time.
    expect(find.text(expectedFormattedTime), findsOneWidget);

    // Wait for some time to elapse (e.g., 1 second).
    await tester.pump(const Duration(seconds: 1));

    // Calculate the expected formatted time after 1 second has passed.
    const String expectedFormattedTimeAfter1Second = '01:39';

    // Verify that the CountDownTimer displays the correct time after 1 second has passed.
    expect(find.text(expectedFormattedTimeAfter1Second), findsOneWidget);

    // Wait for the timer to finish counting down.
    await tester.pumpAndSettle();
  });
}

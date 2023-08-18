import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:protofy/features/order_pickup/data/models/stadt_salat_model.dart';
import 'package:protofy/features/order_pickup/presentation/widgets/salad_category_list.dart';
import 'package:sizer/sizer.dart';

void main() {
  testWidgets('SaladCategoryList displays title and salad items', (WidgetTester tester) async {
    final List<Product> mockSaladCatList = [
      // Initialize with mock data
    ];

    const String mockTitle = 'Mock Salad Category';

    await tester.pumpWidget(
      Sizer(
        builder: (context, orientation, screenType) {
          return MaterialApp(
            home: SaladCategoryList(
              saladCatList: mockSaladCatList,
              title: mockTitle,
            ),
          );
        },
      ),
    );

    // Find the text widget containing the title
    final titleFinder = find.text(mockTitle);

    // Find the ListView containing salad items
    final listViewFinder = find.byType(ListView);

    expect(titleFinder, findsOneWidget);
    expect(listViewFinder, findsOneWidget);

    // Verify that the number of salad items matches the mock data length
    expect(find.byType(OpenContainer), findsNWidgets(mockSaladCatList.length));
  });
}

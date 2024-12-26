import 'package:flutter/material.dart';
import 'package:flutter_hydrated_bloc/cache_data_test/views/screen2.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'click button test widget',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Screen2(),
        ),
      );

      // Find the button by its text
      final buttonFinder = find.text('back first page');

      // Verify the button is present
      expect(buttonFinder, findsOneWidget);

      // Simulate a tap on the button
      await tester.tap(buttonFinder);

      // Inform the tester to rebuild the widget
      await tester.pumpAndSettle();
    },
  );
}

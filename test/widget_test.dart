// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_hydrated_bloc/cache_data_test/views/screen2.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'Button clicked',
    (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(
        const MaterialApp(
          home: Screen2(),
        ),
      );

      // find the button by its text
      final buttonFinder = find.text('back first page');

      // verify the button is present
      expect(buttonFinder, findsOneWidget);

      // simulate a tap on button
      await tester.tap(buttonFinder);

      // inform the tester to rebuild the widget
      await tester.pumpAndSettle();
    },
  );
}

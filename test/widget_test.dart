// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application/main.dart';

void main() {
  testWidgets('onboarding opens dummy orders and updates their status', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const FoodApp());
    expect(find.text('All your favorites'), findsOneWidget);

    await tester.tap(find.text('NEXT'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 400));

    expect(find.text('My Orders'), findsOneWidget);
    expect(find.text('Chicken Thai Biriyani'), findsOneWidget);
    expect(find.widgetWithText(OutlinedButton, 'Cancel'), findsNWidgets(4));

    await tester.tap(find.widgetWithText(ElevatedButton, 'Done').first);
    await tester.pump();

    expect(find.widgetWithText(OutlinedButton, 'Cancel'), findsNWidgets(3));
  });
}

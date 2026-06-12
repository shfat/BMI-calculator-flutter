// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:bmi_calculator/main.dart';

void main() {
  testWidgets('BMI Calculator initial UI test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(BMICalculator());

    // Verify that the app bar title is correct
    expect(find.text('BMI CALCULATOR'), findsOneWidget);

    // Verify that the body text is displayed
    expect(find.text('Body Text'), findsOneWidget);

    // Verify that the floating action button with add icon exists
    expect(find.byIcon(Icons.add), findsOneWidget);
  });

  testWidgets('Floating action button tap test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(BMICalculator());

    // Verify FAB exists and can be tapped
    final fab = find.byIcon(Icons.add);
    expect(fab, findsOneWidget);

    // Tap the FAB
    await tester.tap(fab);
    await tester.pump();

    // Add your assertions here based on what the button should do
    // For example, if it navigates to another screen or changes state
    // Currently the button has an empty onPressed, so nothing changes
  });
}
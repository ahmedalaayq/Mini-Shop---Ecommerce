// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mini_shop/core/helpers/init_core_functions.dart';
import 'package:mini_shop/mini_shop.dart';

void main() {
  testWidgets('shows the login screen when there is no session', (
    WidgetTester tester,
  ) async {
    await initCoreFunctions();
    await tester.pumpWidget(const MiniShop(
      hasSession: false,
    ));
    await tester.pumpAndSettle();

    expect(find.text('Login to your account'), findsOneWidget);
    expect(find.text('Sign In'), findsOneWidget);
  });
}

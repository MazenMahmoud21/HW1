import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bunyan_app/main.dart';
import 'package:bunyan_app/features/auth/presentation/pages/login_screen.dart';

void main() {
  testWidgets('App smoke test - Login Screen Renders', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our LoginScreen is present.
    expect(find.byType(LoginScreen), findsOneWidget);
    expect(find.text('تسجيل الدخول'), findsWidgets); // Might be title and button
  });
}

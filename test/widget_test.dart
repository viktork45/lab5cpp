import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:your_project_name/login_screen.dart'; 

void main() {
  testWidgets('Login form test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginScreen()));

    final emailField = find.byType(TextField).at(0);
    final passwordField = find.byType(TextField).at(1);
    final loginButton = find.byType(ElevatedButton);

    await tester.enterText(emailField, 'test@example.com');
    await tester.enterText(passwordField, '123456');

    await tester.tap(loginButton);
    await tester.pump();

    expect(find.text('Login successful!'), findsOneWidget);
  });
}
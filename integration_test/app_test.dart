import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:integration_testing/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  app.main();
  group('Integration Testing App', () {
    testWidgets('login and logout testing', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();
      final emailLoginField = find.byKey(const Key('emailLoginField'));
      final passwordLoginField = find.byKey(const Key('passwordLoginField'));
      final loginButton = find.byKey(const Key('loginButton'));
      final logoutButton = find.byKey(const Key('logoutButton'));
      await tester.tap(emailLoginField);
      await tester.enterText(emailLoginField, 'testt@gmail.com');
      await Future.delayed(const Duration(seconds: 2));
      await tester.tap(passwordLoginField);
      await tester.enterText(passwordLoginField, '1234567!!');
      await Future.delayed(const Duration(seconds: 2));
      await tester.tap(loginButton);
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));
      await tester.tap(logoutButton);
      await Future.delayed(const Duration(seconds: 2));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));
      expect(find.text('Login Screen'), findsOneWidget);
    });
  });
}

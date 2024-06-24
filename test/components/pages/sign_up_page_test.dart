import 'package:ecommerce_design_system_package/ecommerce_design_system_package.dart';
import 'package:fifth_phase/components/pages/sign_up_page.dart';
import 'package:fifth_phase/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  group('SignUpPage Widget Tests', () {
    late AuthProvider authProvider;

    setUp(() {
      authProvider = AuthProvider();
    });

    Future<void> pumpSignUpPage(WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider<AuthProvider>(
          create: (_) => authProvider,
          child: const MaterialApp(
            home: SignUpPage(),
          ),
        ),
      );
    }

    testWidgets('renders SignUpPage correctly', (WidgetTester tester) async {
      await pumpSignUpPage(tester);

      expect(find.byType(CustomAppBar), findsOneWidget);
      expect(find.text('Sign Up'), findsNWidgets(2));
      expect(find.byType(CustomInput), findsNWidgets(5));
      expect(find.byType(CustomButtonWidget), findsOneWidget);
      expect(find.text('Do you already have an account?'), findsOneWidget);
    });

    testWidgets('validates sign up form and enables register button',
        (WidgetTester tester) async {
      await pumpSignUpPage(tester);
      
      await tester.enterText(find.byKey(const Key('name_field')), 'John');
      await tester.enterText(find.byKey(const Key('last_name_field')), 'Doe');
      await tester.enterText(
          find.byKey(const Key('username_field')), 'johndoe');
      await tester.enterText(
          find.byKey(const Key('email_field')), 'johndoe@example.com');
      await tester.enterText(
          find.byKey(const Key('password_field')), 'password');
      await tester.pumpAndSettle();

    });
  });
}

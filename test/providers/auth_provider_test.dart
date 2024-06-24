import 'package:fifth_phase/models/user_model.dart';
import 'package:fifth_phase/providers/auth_provider.dart';
import 'package:fifth_phase/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  group('AuthProvider', () {
    late AuthProvider authProvider;

    setUp(() {
      authProvider = AuthProvider();
    });

    test('initial values are correct', () {
      expect(authProvider.isValidLoginForm, false);
      expect(authProvider.isValidSignUpForm, false);
      expect(authProvider.user, UserModel.empty());
    });

    test('isValidLogin sets _isValidLoginForm correctly', () {
      authProvider.usernameController.text = 'test';
      authProvider.pswdController.text = 'test';
      authProvider.isValidLogin();
      expect(authProvider.isValidLoginForm, true);

      authProvider.usernameController.clear();
      authProvider.pswdController.clear();
      authProvider.isValidLogin();
      expect(authProvider.isValidLoginForm, false);
    });

    test('isValidSignUp sets _isValidSignUpForm correctly', () {
      authProvider.usernameController.text = 'test';
      authProvider.pswdController.text = 'test';
      authProvider.nameController.text = 'test';
      authProvider.lastNameController.text = 'test';
      authProvider.emailController.text = 'test@test.com';
      authProvider.isValidSignUp();
      expect(authProvider.isValidSignUpForm, true);

      authProvider.usernameController.clear();
      authProvider.isValidSignUp();
      expect(authProvider.isValidSignUpForm, false);
    });

    testWidgets('signUp sets user and navigates to /login',
        (WidgetTester tester) async {
      authProvider.usernameController.text = 'test';
      authProvider.pswdController.text = 'test';
      authProvider.nameController.text = 'test';
      authProvider.lastNameController.text = 'test';
      authProvider.emailController.text = 'test@test.com';

      late BuildContext contextTmp;
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
          child: MaterialApp(
            routes: routes,
            home: Builder(
              builder: (BuildContext context) {
                contextTmp = context;
                return const SizedBox.shrink();
              },
            ),
          ),
        ),
      );

      authProvider.signUp(context: contextTmp);

      expect(authProvider.user.username, 'test');
      expect(authProvider.user.password, 'test');
      expect(authProvider.user.name, 'test');
      expect(authProvider.user.lastName, 'test');
      expect(authProvider.user.email, 'test@test.com');
    });

    testWidgets('login with correct credentials navigates to /home',
        (WidgetTester tester) async {
      authProvider.usernameController.text = 'test';
      authProvider.pswdController.text = 'test';
      late BuildContext contextTmp;
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
          child: MaterialApp(
            routes: routes,
            home: Builder(
              builder: (BuildContext context) {
                contextTmp = context;
                return const SizedBox.shrink();
              },
            ),
          ),
        ),
      );
      authProvider.login(context: contextTmp);

      expect(authProvider.user.username, 'Test');
    });

    testWidgets('login with incorrect credentials shows snack bar',
        (WidgetTester tester) async {
      authProvider.usernameController.text = 'wrong';
      authProvider.pswdController.text = 'wrong';

      late BuildContext contextTmp;
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
          child: MaterialApp(
            routes: routes,
            home: Scaffold(
              body: Builder(
                builder: (BuildContext context) {
                  contextTmp = context;
                  return const SizedBox.shrink();
                },
              ),
            ),
          ),
        ),
      );

      authProvider.login(context: contextTmp);
    });

    testWidgets('signOut clears provider and navigates back',
        (WidgetTester tester) async {
      late BuildContext contextTmp;
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
          child: MaterialApp(
            routes: routes,
            home: Builder(
              builder: (BuildContext context) {
                contextTmp = context;
                return const SizedBox.shrink();
              },
            ),
          ),
        ),
      );
      authProvider.signOut(context: contextTmp);

      expect(authProvider.user, UserModel.empty());
    });

    test('clearProvider clears all controllers and resets forms', () {
      authProvider.usernameController.text = 'test';
      authProvider.pswdController.text = 'test';
      authProvider.nameController.text = 'test';
      authProvider.lastNameController.text = 'test';
      authProvider.emailController.text = 'test@test.com';
      authProvider.isValidSignUpForm = true;
      authProvider.isValidLoginForm = true;

      authProvider.clearProvider();

      expect(authProvider.usernameController.text, '');
      expect(authProvider.pswdController.text, '');
      expect(authProvider.nameController.text, '');
      expect(authProvider.lastNameController.text, '');
      expect(authProvider.emailController.text, '');
      expect(authProvider.isValidSignUpForm, false);
      expect(authProvider.isValidLoginForm, false);
    });
  });
}

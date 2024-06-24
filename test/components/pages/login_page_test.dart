import 'package:fifth_phase/providers/auth_provider.dart';
import 'package:fifth_phase/providers/cart_provider.dart';
import 'package:fifth_phase/providers/category_provider.dart';
import 'package:fifth_phase/providers/lateral_menu_provider.dart';
import 'package:fifth_phase/providers/product_provider.dart';
import 'package:fifth_phase/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:provider/provider.dart';

void main() {
  group('LoginPage Widget Tests', () {
    testWidgets('Login button works correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => CategoryProvider()),
            ChangeNotifierProvider(create: (_) => ProductProvider()),
            ChangeNotifierProvider(create: (_) => LateralMenuProvider()),
            ChangeNotifierProvider(create: (_) => AuthProvider()),
            ChangeNotifierProvider(create: (_) => CartProvider()),
          ],
          child: MaterialApp(
            routes: routes,
            initialRoute: '/login'
          ),
        ),
      );

      await tester.enterText(find.byKey(const Key('username_field')), 'test');
      await tester.enterText(find.byKey(const Key('password_field')), 'test');

      await tester.tap(find.text('Login'));
      await tester.pumpAndSettle();
    });
  });
}

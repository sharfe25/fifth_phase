import 'package:connect_fake_store/models/product_model.dart';
import 'package:connect_fake_store/models/rating_model.dart';
import 'package:fifth_phase/components/organism/categories.dart';
import 'package:fifth_phase/components/organism/custom_search_bar.dart';
import 'package:fifth_phase/components/pages/home_page.dart';
import 'package:fifth_phase/providers/auth_provider.dart';
import 'package:fifth_phase/providers/cart_provider.dart';
import 'package:fifth_phase/providers/category_provider.dart';
import 'package:fifth_phase/providers/lateral_menu_provider.dart';
import 'package:fifth_phase/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:ecommerce_design_system_package/ecommerce_design_system_package.dart';

void main() {
  late ProductProvider productProvider;

  group('HomePage Widget Tests', () {
    setUp(() {
      productProvider = ProductProvider();
    });

    Future<void> pumpHomePage(WidgetTester tester) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<ProductProvider>(
                create: (_) => productProvider),
            ChangeNotifierProvider<LateralMenuProvider>(
                create: (_) => LateralMenuProvider()),
            ChangeNotifierProvider<CartProvider>(create: (_) => CartProvider()),
            ChangeNotifierProvider<CategoryProvider>(
                create: (_) => CategoryProvider()),
            ChangeNotifierProvider<AuthProvider>(
                create: (_) => AuthProvider()),
          ],
          child: const MaterialApp(
            home: HomePage(),
          ),
        ),
      );
    }

    testWidgets('renders HomePage correctly', (WidgetTester tester) async {
      await pumpHomePage(tester);

      expect(find.byType(DashboardTemplate), findsOneWidget);
      expect(find.byType(CardContainer), findsOneWidget);
      expect(find.byType(CustomSearchBar), findsOneWidget);
      expect(find.byType(Categories), findsOneWidget);
      expect(find.text('Promotions'), findsOneWidget);
      expect(find.byType(PromotionalBanners), findsOneWidget);
      expect(find.byType(CardsGrid), findsOneWidget);
    });

    testWidgets('Home with products', (WidgetTester tester) async {
      productProvider.products = [
        ProductModel(
            id: 1,
            title: 'title',
            image: '',
            category: 'category',
            description: 'description',
            price: 19,
            rating: RatingModel.empty())
      ];
      await pumpHomePage(tester);

      await tester.tap(find.byKey(const Key('menu_btn')).last);
      tester.pumpAndSettle();
    });
  });
}

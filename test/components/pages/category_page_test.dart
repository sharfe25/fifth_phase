import 'package:connect_fake_store/models/product_model.dart';
import 'package:connect_fake_store/models/rating_model.dart';
import 'package:ecommerce_design_system_package/ecommerce_design_system_package.dart';
import 'package:fifth_phase/components/pages/category_page.dart';
import 'package:fifth_phase/providers/cart_provider.dart';
import 'package:fifth_phase/providers/category_provider.dart';
import 'package:fifth_phase/providers/lateral_menu_provider.dart';
import 'package:fifth_phase/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  late ProductProvider productProvider;

  group('Cart page Widget Tests', () {
    setUp(() {
      productProvider = ProductProvider();
    });

    Future<void> pumpCategoryPage(WidgetTester tester) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<ProductProvider>(
                create: (_) => productProvider),
            ChangeNotifierProvider<LateralMenuProvider>(
                create: (_) => LateralMenuProvider()),
            ChangeNotifierProvider<CategoryProvider>(
                create: (_) => CategoryProvider()),
            ChangeNotifierProvider<CartProvider>(create: (_) => CartProvider())
          ],
          child: const MaterialApp(
            home: CategoryPage(),
          ),
        ),
      );
    }

    testWidgets('renders CategoryPage correctly', (WidgetTester tester) async {
      await pumpCategoryPage(tester);

      expect(find.text('Category'), findsOneWidget);
      expect(find.byType(CardsGrid), findsOneWidget);
    });

    testWidgets('Category page with products', (WidgetTester tester) async {
      productProvider.productSelected = ProductModel(
          id: 1,
          title: 'title',
          image: '',
          category: 'category',
          description: 'description',
          price: 19,
          rating: RatingModel.empty());
      await pumpCategoryPage(tester);
    });
  });
}

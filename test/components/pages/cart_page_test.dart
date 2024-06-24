import 'package:connect_fake_store/models/product_model.dart';
import 'package:connect_fake_store/models/rating_model.dart';
import 'package:fifth_phase/components/pages/cart_page.dart';
import 'package:fifth_phase/models/cart_product_model.dart';
import 'package:fifth_phase/providers/cart_provider.dart';
import 'package:fifth_phase/providers/category_provider.dart';
import 'package:fifth_phase/providers/lateral_menu_provider.dart';
import 'package:fifth_phase/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  late CartProvider cartProvider;

  group('Cart page Widget Tests', () {
    setUp(() {
      cartProvider = CartProvider();
    });

    Future<void> pumpCartPage(WidgetTester tester) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<ProductProvider>(
                create: (_) => ProductProvider()),
            ChangeNotifierProvider<LateralMenuProvider>(
                create: (_) => LateralMenuProvider()),
            ChangeNotifierProvider<CategoryProvider>(
                create: (_) => CategoryProvider()),
            ChangeNotifierProvider<CartProvider>(create: (_) => cartProvider)
          ],
          child: const MaterialApp(
            home: CartPage(),
          ),
        ),
      );
    }

    testWidgets('renders CartPage correctly', (WidgetTester tester) async {
      await pumpCartPage(tester);

      expect(find.text('Cart'), findsOneWidget);
      expect(find.text('Shopping cart is empty'), findsOneWidget);
    });

    testWidgets('Cart page with products', (WidgetTester tester) async {
      cartProvider.productsInCart = [
        CartProductModel(
            quantity: 2,
            product: ProductModel(
                id: 1,
                title: 'title',
                image: '',
                category: 'category',
                description: 'description',
                price: 19,
                rating: RatingModel.empty())),
        CartProductModel(
            quantity: 2,
            product: ProductModel(
                id: 1,
                title: 'title',
                image: '',
                category: 'category',
                description: 'description',
                price: 19,
                rating: RatingModel.empty()))
      ];
      await pumpCartPage(tester);
    });
  });
}

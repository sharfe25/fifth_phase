import 'package:connect_fake_store/models/product_model.dart';
import 'package:connect_fake_store/models/rating_model.dart';
import 'package:fifth_phase/providers/auth_provider.dart';
import 'package:fifth_phase/providers/cart_provider.dart';
import 'package:fifth_phase/providers/product_provider.dart';
import 'package:fifth_phase/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import '../mocks/mocks.mocks.dart';

void main() {
  group('ProductProvider', () {
    late ProductProvider productProvider;
    late MockConnectFakeStore mockConnectFakeStore;
    late MockProductController mockProductController;

    setUp(() {
      mockConnectFakeStore = MockConnectFakeStore();
      mockProductController = MockProductController();

      when(mockConnectFakeStore.productController)
          .thenReturn(mockProductController);

      productProvider = ProductProvider(connectFakeStore: mockConnectFakeStore);
    });

    test('Initial values are correct', () {
      expect(productProvider.products, []);
      expect(productProvider.productsByCategory, []);
      expect(productProvider.isLoading, true);
      expect(productProvider.titleProductsByCategory, null);
    });

    testWidgets('selectProduct sets productSelected and navigates',
        (WidgetTester tester) async {
      late BuildContext contextTmp;
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => ProductProvider()),
            ChangeNotifierProvider(create: (_) => AuthProvider()),
          ],
          child: MaterialApp(
            routes: routes,
            home: Builder(
              builder: (context) {
                contextTmp = context;
                return Container();
              },
            ),
          ),
        ),
      );

      final product = ProductModel(
          id: 1,
          title: 'Test Product',
          price: 10.0,
          description: 'Test Description',
          category: 'Test Category',
          image: 'test.png',
          rating: RatingModel.empty());

      productProvider.selectProduct(context: contextTmp, product: product);

      expect(productProvider.productSelected, product);
    });

    test('getAllProducts updates products and sets isLoading to false',
        () async {
      final products = [
        ProductModel(
            id: 1,
            title: 'Test Product',
            price: 10.0,
            description: 'Test Description',
            category: 'Test Category',
            image: 'test.png',
            rating: RatingModel.empty())
      ];

      when(mockProductController.getAllProducts()).thenAnswer((_) async => {});
      when(mockProductController.products).thenReturn(products);

      await productProvider.getAllProducts();

      expect(productProvider.products, products);
      expect(productProvider.isLoading, false);
    });

    testWidgets(
        'getProductsByCategory updates productsByCategory and sets isLoading to false',
        (WidgetTester tester) async {
      late BuildContext contextTmp;
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => ProductProvider()),
            ChangeNotifierProvider(create: (_) => AuthProvider()),
          ],
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
      final productsByCategory = [
        ProductModel(
            id: 1,
            title: 'Test Product',
            price: 10.0,
            description: 'Test Description',
            category: 'Test Category',
            image: 'test.png',
            rating: RatingModel.empty())
      ];

      when(mockProductController.getProductsByCategory(
              category: 'Test Category'))
          .thenAnswer((_) async => {});
      when(mockProductController.productsByCategory)
          .thenReturn(productsByCategory);

      await productProvider.getProductsByCategory(
          category: 'Test Category', context: contextTmp);

      expect(productProvider.productsByCategory, productsByCategory);
      expect(productProvider.isLoading, false);
      expect(productProvider.titleProductsByCategory, 'Test Category');
    });

    test('searchProduct filters products based on search query', () {
      final products = [
        ProductModel(
            id: 1,
            title: 'Test Product',
            price: 10.0,
            description: 'Test Description',
            category: 'Test Category',
            image: 'test.png',
            rating: RatingModel.empty()),
        ProductModel(
            id: 2,
            title: 'Another Product',
            price: 20.0,
            description: 'Another Description',
            category: 'Another Category',
            image: 'another.png',
            rating: RatingModel.empty())
      ];

      productProvider.products = products;

      productProvider.searchController.text = 'test';
      productProvider.searchProduct();

      expect(productProvider.productsSearched, [products[0]]);

      productProvider.searchController.text = 'another';
      productProvider.searchProduct();

      expect(productProvider.productsSearched, [products[1]]);
    });

    testWidgets('createCardProducts creates a list of ProductCardModel', (WidgetTester tester) async{
      late BuildContext contextTmp;
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => ProductProvider()),
            ChangeNotifierProvider(create: (_) => CartProvider()),
          ],
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
      final products = [
        ProductModel(
            id: 1,
            title: 'Test Product',
            price: 10.0,
            description: 'Test Description',
            category: 'Test Category',
            image: 'test.png',
            rating: RatingModel.empty())
      ];


      final cardProducts = productProvider.createCardProducts(
        context: contextTmp,
        allProducts: products,
        productProvider: productProvider,
        cartProvider: CartProvider(),
      );

      expect(cardProducts.length, products.length);
      expect(cardProducts[0].title, products[0].title);
      expect(cardProducts[0].price, products[0].price);
    });
  
  });
}

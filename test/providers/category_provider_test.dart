import 'package:connect_fake_store/models/category_model.dart';
import 'package:fifth_phase/providers/category_provider.dart';
import 'package:fifth_phase/providers/product_provider.dart';
import 'package:fifth_phase/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import '../mocks/mocks.mocks.dart';

void main() {
  late MockConnectFakeStore mockConnectFakeStore;
  late MockCategoryController mockCategoryController;
  late CategoryProvider categoryProvider;

  setUp(() {
    mockConnectFakeStore = MockConnectFakeStore();
    mockCategoryController = MockCategoryController();

    when(mockConnectFakeStore.categoryController)
        .thenReturn(mockCategoryController);

    categoryProvider = CategoryProvider(connectFakeStore: mockConnectFakeStore);
  });

  test('getAllCategories updates categories and sets isLoading to false',
      () async {
    final categories = [
      CategoryModel(name: 'Test Category 1'),
      CategoryModel(name: 'Test Category 2'),
    ];

    when(mockCategoryController.getAllCategories()).thenAnswer((_) async => {});
    when(mockCategoryController.categories).thenReturn(categories);

    await categoryProvider.getAllCategories();

    expect(categoryProvider.categories, categories);
    expect(categoryProvider.isLoading, false);
  });

  testWidgets('createCarouselChips creates chips correctly',  (WidgetTester tester) async{
    final categories = [
      CategoryModel(name: 'Category 1'),
      CategoryModel(name: 'Category 2'),
    ];
    late BuildContext contextTmp;
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => categoryProvider),
            ChangeNotifierProvider(create: (_) => ProductProvider()),
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
    when(mockCategoryController.categories).thenReturn(categories);
    await categoryProvider.getAllCategories();

    final chips = categoryProvider.createCarouselChips(
      context:contextTmp,
      productProvider: ProductProvider(),
    );

    expect(chips.length, 2);
    expect(chips[0].title, 'Category 1');
    expect(chips[1].title, 'Category 2');
  });
}

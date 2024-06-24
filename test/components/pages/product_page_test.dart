import 'package:fifth_phase/components/pages/product_page.dart';
import 'package:fifth_phase/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  late ProductProvider productProvider;

  group('Product Page Widget Tests', () {
    setUp(() {
      productProvider = ProductProvider();
    });

    Future<void> pumpProductPage(WidgetTester tester) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<ProductProvider>(
                create: (_) => productProvider),
          ],
          child: const MaterialApp(
            home: ProductPage(),
          ),
        ),
      );
    }

    testWidgets('renders ProductPage correctly', (WidgetTester tester) async {
      await pumpProductPage(tester);

      expect(find.text('Description'), findsOneWidget);
      expect(find.text('Category'), findsOneWidget);
    });

  });
}

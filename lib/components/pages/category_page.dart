// lib/screens/home_screen.dart
import 'package:ecommerce_design_system_package/ecommerce_design_system_package.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/cart_provider.dart';
import '../../providers/product_provider.dart';
import '../tokens/app_spacing.dart';

/// A screen that displays products belonging to a specific category.
///
/// The [CategoryPage] widget fetches products belonging to a specific category
/// using a [ProductProvider] and displays them using a [ProductsGrid].
class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider =
        Provider.of<ProductProvider>(context, listen: true);
    final CartProvider cartProvider =
        Provider.of<CartProvider>(context, listen: true);
    return DashboardTemplate(
      title: 'Category',
      onTapBack: () => Navigator.pop(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: AppSpacing.small,
            ),
            CardsGrid(
                isLoading: productProvider.isLoading,
                title: '${productProvider.titleProductsByCategory} (${productProvider.productsByCategory.length})',
                cards: productProvider.createCardProducts(
                    context: context,
                    productProvider: productProvider,
                    allProducts: productProvider.productsByCategory,
                    cartProvider: cartProvider))
          ],
        ),
      ),
    );
  }
}

import 'package:ecommerce_design_system_package/ecommerce_design_system_package.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/cart_provider.dart';
import '../../providers/product_provider.dart';
import '../organism/custom_search_bar.dart';
import '../tokens/app_text_styles.dart';

/// A screen that allows users to search for products.
///
/// The [SearchPage] widget provides a search bar where users can input
/// search queries to find products. It displays the search results in a
/// grid layout using [CardsGrid]. It utilizes a [ProductProvider] to manage
/// and display searched products and a [CartProvider] to handle cart actions.
class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartProvider cartProvider =
        Provider.of<CartProvider>(context, listen: true);
    final ProductProvider productProvider =
        Provider.of<ProductProvider>(context, listen: true);

    return DashboardTemplate(
      title: 'Search Product',
      onTapBack: () {
        productProvider.searchController.clear();
        Navigator.pop(context);
      },
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomSearchBar(
              key: const Key('search_bar'),
              autofocus: true,
              productProvider: productProvider,
            ),
            if (productProvider.productsSearched.isEmpty)
              const Padding(
                padding: EdgeInsets.all(80.0),
                child: Text(
                  'No products found',
                  style: AppTextStyles.subtitle,
                  textAlign: TextAlign.center,
                ),
              )
            else
              CardsGrid(
                isLoading: productProvider.isLoading,
                title: 'Products (${productProvider.productsSearched.length})',
                cards: productProvider.createCardProducts(
                  context: context,
                  productProvider: productProvider,
                  allProducts:
                      context.watch<ProductProvider>().productsSearched,
                  cartProvider: cartProvider,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

import 'package:ecommerce_design_system_package/ecommerce_design_system_package.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/cart_provider.dart';
import '../../providers/lateral_menu_provider.dart';
import '../../providers/product_provider.dart';
import '../molecules/card_container.dart';
import '../molecules/home/promotional_banners.dart';
import '../organism/custom_search_bar.dart';
import '../organism/home/categories.dart';
import '../organism/lateral_menu.dart';
import '../tokens/app_spacing.dart';
import '../tokens/app_text_styles.dart';

/// A screen that serves as the home page of the application.
///
/// The [HomePage] widget displays a welcome card, a list of categories,
/// and a grid of products. It uses a [ProductProvider] to fetch and manage
/// product data.
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ProductProvider productProvider;

  @override
  void initState() {
    super.initState();

    productProvider = Provider.of<ProductProvider>(context, listen: false);
    productProvider.getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    final LateralMenuProvider lateralMenuProvider =
        Provider.of<LateralMenuProvider>(context, listen: true);
    final CartProvider cartProvider =
        Provider.of<CartProvider>(context, listen: false);
    return DashboardTemplate(
      bagBadge: context.watch<CartProvider>().productsInCart.length,
      onTapBag: () {
        Navigator.pushNamed(
          context,
          '/cart',
        );
      },
      onTapMenu: () {
        lateralMenuProvider.displayMenu(showMenuValue: true);
      },
      lateralMenu: lateralMenuProvider.showMenu ? const LateralMenu() : null,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CardContainer(
              title: 'Explore',
              subtitle: 'Welcome to Fake Store.',
            ),
            CustomSearchBar(
              enabled: false,
              productProvider: productProvider,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/search',
                );
              },
            ),
            Categories(productProvider: productProvider),
            const SizedBox(
              height: AppSpacing.medium,
            ),
            const Text(
              'Promotions',
              style: AppTextStyles.subtitle,
            ),
            const PromotionalBanners(),
            CardsGrid(
              isLoading: productProvider.isLoading,
              title: 'New Arrival',
              cards: productProvider.createCardProducts(
                context: context,
                productProvider: productProvider,
                allProducts: context.watch<ProductProvider>().products,
                cartProvider: cartProvider,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

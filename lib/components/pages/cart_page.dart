import 'package:ecommerce_design_system_package/ecommerce_design_system_package.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/cart_product_model.dart';
import '../../providers/cart_provider.dart';
import '../molecules/cart_product_card.dart';
import '../tokens/app_colors.dart';
import '../tokens/app_spacing.dart';
import '../tokens/app_text_styles.dart';

/// A stateless widget that displays the shopping cart page.
///
/// The [CartPage] widget shows the products added to the cart using a
/// [ListView.separated]. It also handles scenarios where the cart is empty
/// by showing a message.
class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartProvider cartProvider =
        Provider.of<CartProvider>(context, listen: true);

    return DashboardTemplate(
      title: 'Cart',
      onTapBack: () => Navigator.pop(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (cartProvider.productsInCart.isEmpty)
              const Padding(
                padding: EdgeInsets.all(50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.local_mall_outlined,
                      color: AppColors.subtitleColor,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                        'Shopping cart is empty',
                        style: AppTextStyles.subtitle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              )
            else
              ListView.separated(
                itemCount: cartProvider.productsInCart.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: AppSpacing.large,
                  );
                },
                itemBuilder: (context, index) {
                  CartProductModel product = cartProvider.productsInCart[index];
                  return CartProductCard(
                    cartProduct: product,
                    cartProvider: cartProvider,
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}

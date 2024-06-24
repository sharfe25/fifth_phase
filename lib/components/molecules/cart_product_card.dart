import 'package:ecommerce_design_system_package/ecommerce_design_system_package.dart';
import 'package:flutter/material.dart';

import '../../models/cart_product_model.dart';
import '../../providers/cart_provider.dart';

/// A stateless widget that displays a card for a product in the cart.
class CartProductCard extends StatelessWidget {
  /// The model representing the product in the cart.
  final CartProductModel cartProduct;

  /// The provider for managing cart operations.
  final CartProvider cartProvider;

  /// Creates a [CartProductCard] widget.
  const CartProductCard({
    Key? key,
    required this.cartProduct,
    required this.cartProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CartCard(
      title: cartProduct.product.title,
      image: cartProduct.product.image,
      price: '\$${cartProduct.product.price.toStringAsFixed(2)}',
      actions: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButtonWidget(
                onTap: () => cartProvider.increaseQuantity(
                  product: cartProduct.product,
                ),
                icon: Icons.add,
              ),
              Text(cartProduct.quantity.toString()),
              IconButtonWidget(
                onTap: () => cartProvider.decreaseQuantity(
                  product: cartProduct.product,
                ),
                icon: Icons.remove,
              ),
            ],
          ),
          IconButtonWidget(
            onTap: () => cartProvider.deleteProduct(cartProduct: cartProduct),
            icon: Icons.delete,
          ),
        ],
      ),
    );
  }
}

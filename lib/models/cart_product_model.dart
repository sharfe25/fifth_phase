import 'package:connect_fake_store/models/product_model.dart';

/// A model class representing a product in the shopping cart.
///
/// Each [CartProductModel] instance contains information about the quantity
/// of a specific [ProductModel] added to the cart.
class CartProductModel {
  /// The quantity of the product added to the cart.
  final num quantity;

  /// The product associated with this cart item.
  final ProductModel product;

  /// Constructs a [CartProductModel] with the given [quantity] and [product].
  ///
  /// Both parameters are required and must not be null.
  CartProductModel({
    required this.quantity,
    required this.product,
  });
}

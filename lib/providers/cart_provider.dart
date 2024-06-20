import 'package:connect_fake_store/models/product_model.dart';
import 'package:flutter/material.dart';

import '../models/cart_product_model.dart';

/// A class that manages the cart functionality for storing products.
class CartProvider with ChangeNotifier {
  List<CartProductModel> _productsInCart = [];

  /// Retrieves the list of products currently in the cart.
  List<CartProductModel> get productsInCart => _productsInCart;

  /// Adds a product to the cart.
  ///
  /// If the product is already in the cart, increases its quantity by 1.
  /// Otherwise, adds the product as a new entry with quantity 1.
  void addProduct({required ProductModel product}) {
    int index = _productsInCart.indexWhere((cartProduct) => cartProduct.product.id == product.id);

    if (index != -1) {
      _productsInCart[index] = CartProductModel(
        quantity: _productsInCart[index].quantity + 1,
        product: _productsInCart[index].product,
      );
    } else {
      _productsInCart.add(CartProductModel(
        quantity: 1,
        product: product,
      ));
    }

    notifyListeners();
  }

  /// Deletes a product from the cart.
  ///
  /// [cartProduct] is the product model to be removed from the cart.
  void deleteProduct({required CartProductModel cartProduct}) {
    _productsInCart.removeWhere((product) => product.product.id == cartProduct.product.id);
    notifyListeners();
  }

  /// Increases the quantity of a product in the cart by 1.
  ///
  /// [product] is the product model whose quantity will be increased.
  void increaseQuantity({required ProductModel product}) {
    int index = _productsInCart.indexWhere((cartProduct) => cartProduct.product.id == product.id);

    if (index != -1) {
      _productsInCart[index] = CartProductModel(
        quantity: _productsInCart[index].quantity + 1,
        product: _productsInCart[index].product,
      );
      notifyListeners();
    }
  }

  /// Decreases the quantity of a product in the cart by 1.
  ///
  /// If the quantity of the product is 1, removes it from the cart.
  /// [product] is the product model whose quantity will be decreased.
  void decreaseQuantity({required ProductModel product}) {
    int index = _productsInCart.indexWhere((cartProduct) => cartProduct.product.id == product.id);

    if (index != -1) {
      if (_productsInCart[index].quantity > 1) {
        _productsInCart[index] = CartProductModel(
          quantity: _productsInCart[index].quantity - 1,
          product: _productsInCart[index].product,
        );
      } else {
        _productsInCart.removeAt(index);
      }
      notifyListeners();
    }
  }

  /// Clears all products from the cart.
  void clearProvider() {
    _productsInCart = [];
    notifyListeners();
  }
}

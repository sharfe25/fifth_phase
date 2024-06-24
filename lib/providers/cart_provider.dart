import 'package:connect_fake_store/models/product_model.dart';
import 'package:flutter/material.dart';

import '../models/cart_product_model.dart';

/// A class that manages the cart functionality for storing products.
class CartProvider with ChangeNotifier {
  List<CartProductModel> productsInCart = [];

  void addProduct({required ProductModel product}) {
    int index = productsInCart.indexWhere((cartProduct) => cartProduct.product.id == product.id);

    if (index != -1) {
      productsInCart[index] = CartProductModel(
        quantity: productsInCart[index].quantity + 1,
        product: productsInCart[index].product,
      );
    } else {
      productsInCart.add(CartProductModel(
        quantity: 1,
        product: product,
      ));
    }

    notifyListeners();
  }

  void deleteProduct({required CartProductModel cartProduct}) {
    productsInCart.removeWhere((product) => product.product.id == cartProduct.product.id);
    notifyListeners();
  }

  void increaseQuantity({required ProductModel product}) {
    int index = productsInCart.indexWhere((cartProduct) => cartProduct.product.id == product.id);

    if (index != -1) {
      productsInCart[index] = CartProductModel(
        quantity: productsInCart[index].quantity + 1,
        product: productsInCart[index].product,
      );
      notifyListeners();
    }
  }

  void decreaseQuantity({required ProductModel product}) {
    int index = productsInCart.indexWhere((cartProduct) => cartProduct.product.id == product.id);

    if (index != -1) {
      if (productsInCart[index].quantity > 1) {
        productsInCart[index] = CartProductModel(
          quantity: productsInCart[index].quantity - 1,
          product: productsInCart[index].product,
        );
      } else {
        productsInCart.removeAt(index);
      }
      notifyListeners();
    }
  }

  void clearProvider() {
    productsInCart = [];
    notifyListeners();
  }
}

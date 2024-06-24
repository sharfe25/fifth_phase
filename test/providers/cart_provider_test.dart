import 'package:connect_fake_store/models/rating_model.dart';
import 'package:fifth_phase/providers/cart_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:connect_fake_store/models/product_model.dart';

void main() {
  group('CartProvider', () {
    late CartProvider cartProvider;
    late ProductModel product1;
    late ProductModel product2;

    setUp(() {
      cartProvider = CartProvider();
      product1 = ProductModel(
        id: 1,
        title: 'Test Product 1',
        price: 10.0,
        description: 'Test Description 1',
        category: 'Test Category 1',
        image: 'test1.png',
        rating: RatingModel.empty(),
      );
      product2 = ProductModel(
        id: 2,
        title: 'Test Product 2',
        price: 20.0,
        description: 'Test Description 2',
        category: 'Test Category 2',
        image: 'test2.png',
        rating: RatingModel.empty(),
      );
    });

    test('addProduct adds a product to the cart', () {
      cartProvider.addProduct(product: product1);

      expect(cartProvider.productsInCart.length, 1);
      expect(cartProvider.productsInCart[0].product, product1);
      expect(cartProvider.productsInCart[0].quantity, 1);
    });

    test('addProduct increases quantity if product already in cart', () {
      cartProvider.addProduct(product: product1);
      cartProvider.addProduct(product: product1);

      expect(cartProvider.productsInCart.length, 1);
      expect(cartProvider.productsInCart[0].quantity, 2);
    });

    test('deleteProduct removes a product from the cart', () {
      cartProvider.addProduct(product: product1);
      cartProvider.deleteProduct(cartProduct: cartProvider.productsInCart[0]);

      expect(cartProvider.productsInCart.length, 0);
    });

    test('increaseQuantity increases the quantity of a product', () {
      cartProvider.addProduct(product: product1);
      cartProvider.increaseQuantity(product: product1);

      expect(cartProvider.productsInCart[0].quantity, 2);
    });

    test('decreaseQuantity decreases the quantity of a product', () {
      cartProvider.addProduct(product: product1);
      cartProvider.increaseQuantity(product: product1);
      cartProvider.decreaseQuantity(product: product1);

      expect(cartProvider.productsInCart[0].quantity, 1);
    });

    test('decreaseQuantity removes product if quantity goes below 1', () {
      cartProvider.addProduct(product: product1);
      cartProvider.decreaseQuantity(product: product1);

      expect(cartProvider.productsInCart.length, 0);
    });

    test('clearProvider clears all products from the cart', () {
      cartProvider.addProduct(product: product1);
      cartProvider.addProduct(product: product2);
      cartProvider.clearProvider();

      expect(cartProvider.productsInCart.length, 0);
    });
  });
}

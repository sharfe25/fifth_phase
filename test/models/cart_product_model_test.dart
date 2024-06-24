import 'package:connect_fake_store/models/product_model.dart';
import 'package:connect_fake_store/models/rating_model.dart';
import 'package:fifth_phase/models/cart_product_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Cart product model test', () {
    test('Return a valid instance of the model', () {
      final CartProductModel issuePlace = CartProductModel(
          product: ProductModel(
              id: 1,
              title: 'title',
              image: 'image',
              category: 'category',
              description: 'description',
              price: 12,
              rating: RatingModel.empty()),
          quantity: 3);

      expect(issuePlace.product.category, equals('category'));
      expect(issuePlace.quantity, equals(3));
      expect(issuePlace.product.title, equals('title'));
    });
  });
}

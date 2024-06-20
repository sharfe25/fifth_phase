import 'package:connect_fake_store/connect_fake_store.dart';
import 'package:connect_fake_store/models/category_model.dart';
import 'package:ecommerce_design_system_package/ecommerce_design_system_package.dart';

import 'package:flutter/material.dart';

import 'product_provider.dart';

/// A class that manages the operations related to categories.
class CategoryProvider with ChangeNotifier {
  final ConnectFakeStore _connectFakeStore = ConnectFakeStore();
  bool _isLoading = true;
  List<CategoryModel> _categories = [];

  /// Retrieves the list of categories.
  List<CategoryModel> get categories => _categories;

  /// Indicates whether data is currently being loaded.
  bool get isLoading => _isLoading;

  /// Fetches all categories from the data source.
  ///
  /// This method uses [_connectFakeStore] to retrieve categories,
  /// sets [_categories] with the fetched data, and updates [_isLoading] status.
  Future<void> getAllCategories() async {
    await _connectFakeStore.categoryController.getAllCategories();
    _categories = _connectFakeStore.categoryController.categories;
    _isLoading = false;
    notifyListeners();
  }

  /// Creates a list of `ChipModel` objects for displaying as carousel chips.
  ///
  /// Each `ChipModel` represents a category and has an onTap function that fetches
  /// products associated with the category.
  ///
  /// [context] is the `BuildContext` used for navigation and displaying UI.
  /// [productProvider] is used to fetch products based on the selected category.
  List<ChipModel> createCarouselChips({
    required BuildContext context,
    required ProductProvider productProvider,
  }) {
    return _categories
        .map((category) => ChipModel(
              title: category.name,
              onTap: () => productProvider.getProductsByCategory(
                category: category.name,
                context: context,
              ),
            ))
        .toList();
  }
}

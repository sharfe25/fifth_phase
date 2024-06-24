import 'package:connect_fake_store/connect_fake_store.dart';
import 'package:connect_fake_store/models/category_model.dart';
import 'package:ecommerce_design_system_package/ecommerce_design_system_package.dart';

import 'package:flutter/material.dart';

import 'product_provider.dart';

/// A class that manages the operations related to categories.
class CategoryProvider with ChangeNotifier {
  final ConnectFakeStore _connectFakeStore;
  bool _isLoading = true;
  List<CategoryModel> _categories = [];

  List<CategoryModel> get categories => _categories;
  bool get isLoading => _isLoading;

  CategoryProvider({ConnectFakeStore? connectFakeStore})
      : _connectFakeStore = connectFakeStore ?? ConnectFakeStore();

  Future<void> getAllCategories() async {
    await _connectFakeStore.categoryController.getAllCategories();
    _categories = _connectFakeStore.categoryController.categories;
    _isLoading = false;
    notifyListeners();
  }

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

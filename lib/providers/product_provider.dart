import 'package:connect_fake_store/connect_fake_store.dart';
import 'package:connect_fake_store/models/product_model.dart';
import 'package:ecommerce_design_system_package/ecommerce_design_system_package.dart';
import 'package:flutter/material.dart';

import 'cart_provider.dart';

/// A provider class for managing product-related operations and state.
class ProductProvider with ChangeNotifier {
  final ConnectFakeStore _connectFakeStore = ConnectFakeStore();
  TextEditingController searchController = TextEditingController();
  bool _isLoading = true;
  List<ProductModel> _products = [];
  List<ProductModel> _productsSearched = [];
  List<ProductModel> _productsByCategory = [];
  String? _titleProductsByCategory;
  ProductModel? _productSelected;

  /// Gets the list of all products.
  List<ProductModel> get products => _products;

  /// Gets the list of searched products.
  List<ProductModel> get productsSearched => _productsSearched;

  /// Gets the list of products filtered by category.
  List<ProductModel> get productsByCategory => _productsByCategory;

  /// Gets the title of the current category being viewed.
  String? get titleProductsByCategory => _titleProductsByCategory;

  /// Indicates whether the data is currently being loaded.
  bool get isLoading => _isLoading;

  /// Gets the currently selected product.
  ProductModel? get productSelected => _productSelected;

  /// Selects a product and navigates to the product detail page.
  void selectProduct({
    required BuildContext context,
    required ProductModel product,
  }) {
    _productSelected = product;
    Navigator.pushNamed(
      context,
      '/product',
    );
  }

  /// Fetches all products from the backend and updates the state.
  Future<void> getAllProducts() async {
    await _connectFakeStore.productController.getAllProducts();
    _products = _connectFakeStore.productController.products;
    _isLoading = false;
    notifyListeners();
  }

  /// Fetches products by a specific category from the backend and updates the state.
  Future<void> getProductsByCategory({
    required String category,
    required BuildContext context,
  }) async {
    _isLoading = true;
    notifyListeners();
    Navigator.pushNamed(
      context,
      '/products_by_category',
    );
    _titleProductsByCategory = category;
    await _connectFakeStore.productController.getProductsByCategory(category: category);
    _productsByCategory = _connectFakeStore.productController.productsByCategory;
    _isLoading = false;
    notifyListeners();
  }

  /// Searches for products based on the query entered in the search controller.
  void searchProduct() {
    String query = searchController.text.toLowerCase();
    if (query.isNotEmpty) {
      _productsSearched = _products.where((product) {
        return product.title.toLowerCase().contains(query) ||
            product.description.toLowerCase().contains(query);
      }).toList();
    } else {
      _productsSearched = [];
    }
    notifyListeners();
  }

  /// Creates a list of `ProductCardModel` instances for display.
  List<ProductCardModel> createCardProducts({
    required BuildContext context,
    required List<ProductModel> allProducts,
    required ProductProvider productProvider,
    required CartProvider cartProvider,
  }) {
    return allProducts.map((product) {
      return ProductCardModel(
        title: product.title,
        image: product.image,
        price: product.price,
        onTapProduct: () => productProvider.selectProduct(
          context: context,
          product: product,
        ),
        addToCart: () => cartProvider.addProduct(product: product),
      );
    }).toList();
  }
}

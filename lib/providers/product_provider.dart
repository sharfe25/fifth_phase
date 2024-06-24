import 'package:ecommerce_design_system_package/models/promotional_banner_model.dart';
import 'package:flutter/material.dart';
import 'package:connect_fake_store/connect_fake_store.dart';
import 'package:connect_fake_store/models/product_model.dart';
import 'package:ecommerce_design_system_package/ecommerce_design_system_package.dart';
import 'cart_provider.dart';

class ProductProvider with ChangeNotifier {
  final ConnectFakeStore _connectFakeStore;
  TextEditingController searchController = TextEditingController();
  bool _isLoading = true;
  List<ProductModel> products = [];
  List<ProductModel> productsSearched = [];
  List<ProductModel> _productsByCategory = [];
  String? _titleProductsByCategory;
  ProductModel? productSelected;
  final List<PromotionalBannerModel> promotionalBanners = [
    const PromotionalBannerModel(
        image: AssetImage('assets/banner.png'),
        title: 'Discount of all types of products',
        promotion: 'Up to 45%'),
    const PromotionalBannerModel(
        image: AssetImage('assets/banner.png'),
        title: 'Discount of all types of products',
        promotion: 'Up to 45%'),
    const PromotionalBannerModel(
        image: AssetImage('assets/banner.png'),
        title: 'Discount of all types of products',
        promotion: 'Up to 45%')
  ];

  ProductProvider({ConnectFakeStore? connectFakeStore})
      : _connectFakeStore = connectFakeStore ?? ConnectFakeStore();


  List<ProductModel> get productsByCategory => _productsByCategory;
  String? get titleProductsByCategory => _titleProductsByCategory;
  bool get isLoading => _isLoading;

  void selectProduct({
    required BuildContext context,
    required ProductModel product,
  }) {
    productSelected = product;
    Navigator.pushNamed(context, '/product');
  }

  Future<void> getAllProducts() async {
    await _connectFakeStore.productController.getAllProducts();
    products = _connectFakeStore.productController.products;
    _isLoading = false;
    notifyListeners();
  }

  Future<void> getProductsByCategory({
    required String category,
    required BuildContext context,
  }) async {
    _isLoading = true;
    notifyListeners();
    Navigator.pushNamed(context, '/products_by_category');
    _titleProductsByCategory = category;
    await _connectFakeStore.productController.getProductsByCategory(category: category);
    _productsByCategory = _connectFakeStore.productController.productsByCategory;
    _isLoading = false;
    notifyListeners();
  }

  void searchProduct() {
    String query = searchController.text.toLowerCase();
    if (query.isNotEmpty) {
      productsSearched = products.where((product) {
        return product.title.toLowerCase().contains(query) ||
            product.description.toLowerCase().contains(query);
      }).toList();
    } else {
      productsSearched = [];
    }
    notifyListeners();
  }

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

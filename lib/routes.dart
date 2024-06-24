import 'package:flutter/material.dart';

import 'components/pages/cart_page.dart';
import 'components/pages/category_page.dart';
import 'components/pages/contact_us_page.dart';
import 'components/pages/home_page.dart';
import 'components/pages/login_page.dart';
import 'components/pages/product_page.dart';
import 'components/pages/search_page.dart';
import 'components/pages/sign_up_page.dart';

final Map<String, WidgetBuilder> routes = {
  '/login': (context) => const LoginPage(),
  '/sign_up': (context) => const SignUpPage(),
  '/home': (context) => const HomePage(),
  '/products_by_category': (context) => const CategoryPage(),
  '/product': (context) => const ProductPage(),
  '/search': (context) => const SearchPage(),
  '/cart': (context) => const CartPage(),
  '/contact_us': (context) => const ContactUsPage(),
};

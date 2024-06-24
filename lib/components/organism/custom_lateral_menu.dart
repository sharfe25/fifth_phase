import 'package:ecommerce_design_system_package/ecommerce_design_system_package.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';
import '../../providers/cart_provider.dart';
import '../../providers/lateral_menu_provider.dart';
import '../../utils/string_utils.dart';
import '../tokens/app_colors.dart';

class CustomLateralMenu extends StatelessWidget {
  final LateralMenuProvider lateralMenuProvider;
  const CustomLateralMenu({Key? key, required this.lateralMenuProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartProvider cartProvider =
        Provider.of<CartProvider>(context, listen: false);
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    return LateralMenu(
      lateralMenuController: lateralMenuProvider,
      closeMenu: () => lateralMenuProvider.displayMenu(showMenuValue: false),
      menuOptions: lateralMenuProvider.getMenuOptions(context: context),
      signOut: () {
        authProvider.signOut(context: context);
        lateralMenuProvider.clearProvider();
        cartProvider.clearProvider();
      },
      profileSection: CardContainer(
        color: AppColors.grayColor,
        title: StringUtils.capitalize(authProvider.user.username),
        subtitle: 'Welcome to profile',
      ),
    );
  }
}

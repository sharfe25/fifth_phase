import 'package:ecommerce_design_system_package/ecommerce_design_system_package.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';
import '../../providers/cart_provider.dart';
import '../../providers/lateral_menu_provider.dart';
import '../../utils/string_utils.dart';
import '../molecules/card_container.dart';
import '../molecules/lateral_menu_option.dart';
import '../tokens/app_colors.dart';
import '../tokens/app_spacing.dart';

/// A stateful widget that represents the lateral menu in the application.
class LateralMenu extends StatefulWidget {
  /// Creates a [LateralMenu] widget.
  const LateralMenu({
    Key? key,
  }) : super(key: key);

  @override
  State<LateralMenu> createState() => _LateralMenuState();
}

class _LateralMenuState extends State<LateralMenu>
    with SingleTickerProviderStateMixin {
  late LateralMenuProvider lateralMenuProvider;
  late AuthProvider authProvider;

  @override
  void initState() {
    super.initState();
    lateralMenuProvider = Provider.of<LateralMenuProvider>(context, listen: false);
    lateralMenuProvider.initAnimation(ticker: this);
    authProvider = Provider.of<AuthProvider>(context, listen: false);
  }

  @override
  void dispose() {
    lateralMenuProvider.disposeAnimation();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final CartProvider cartProvider = Provider.of<CartProvider>(context, listen: false);
    return LayoutBuilder(
      builder: (_, BoxConstraints constraints) => Stack(
        children: <Widget>[
          GestureDetector(
            onTap: () async {
              await lateralMenuProvider.animationController.reverse();
              lateralMenuProvider.displayMenu(showMenuValue: false);
            },
            child: Container(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              color: AppColors.blackColor.withOpacity(0.5),
            ),
          ),
          SlideTransition(
            position: lateralMenuProvider.offsetAnimation,
            child: Container(
              color: AppColors.whiteColor,
              width: 273,
              height: constraints.maxHeight,
              child: Padding(
                padding: EdgeInsets.only(
                  left: AppSpacing.small,
                  right: AppSpacing.small,
                  top: MediaQuery.of(context).padding.top,
                  bottom: MediaQuery.of(context).padding.bottom,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: [
                        CardContainer(
                          color: AppColors.grayColor,
                          title: StringUtils.capitalize(authProvider.user.username),
                          subtitle: 'Welcome to profile',
                        ),
                        const SizedBox(
                          height: AppSpacing.medium,
                        ),
                        const Divider(),
                        LateralMenuOption(
                          lateralMenuProvider: lateralMenuProvider,
                          text: 'Contact us',
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/contact_us',
                            );
                          },
                        ),
                        const Divider(),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: AppSpacing.medium),
                      child: CustomButtonWidget(
                        onPressed: () {
                          authProvider.signOut(context: context);
                          lateralMenuProvider.clearProvider();
                          cartProvider.clearProvider();
                        },
                        text: 'Sign out',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:ecommerce_design_system_package/ecommerce_design_system_package.dart';
import 'package:flutter/material.dart';

import '../../providers/product_provider.dart';
import '../tokens/app_colors.dart';
import '../tokens/app_spacing.dart';

/// A stateless widget that provides a custom search bar.
///
/// The [CustomSearchBar] widget includes an input field and a search button,
/// allowing users to search for products. It interacts with the provided
/// [ProductProvider] to manage the search functionality.
class CustomSearchBar extends StatelessWidget {
  /// The provider for managing product data and search functionality.
  final ProductProvider productProvider;

  /// The callback function to execute when the search bar is tapped.
  final VoidCallback? onTap;

  /// Whether the search input is enabled.
  final bool enabled;

  /// Whether the search input should autofocus.
  final bool autofocus;

  /// Creates a [CustomSearchBar] widget.
  ///
  /// The [productProvider] parameter is required.
  /// The [enabled] and [autofocus] parameters are optional and default to `true` and `false` respectively.
  const CustomSearchBar({
    Key? key,
    required this.productProvider,
    this.onTap,
    this.enabled = true,
    this.autofocus = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: AppSpacing.medium),
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.small),
      height: 70,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: CustomInput(
                enabled: enabled,
                controller: productProvider.searchController,
                hintText: 'Search a product',
                onTap: onTap,
                onChanged: productProvider.searchProduct,
                autofocus: autofocus,
              ),
            ),
          ),
          const SizedBox(
            width: AppSpacing.xSmall,
          ),
          IconButtonWidget(
            onTap: onTap ?? productProvider.searchProduct,
            icon: Icons.search,
            backgroundColor: AppColors.primaryColorLight,
            iconColor: AppColors.whiteColor,
          ),
        ],
      ),
    );
  }
}

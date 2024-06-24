import 'package:ecommerce_design_system_package/components/molecules/chips_carousel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/category_provider.dart';
import '../../providers/product_provider.dart';
import '../molecules/skeletons/categories_skeleton.dart';
import '../tokens/app_spacing.dart';
import '../tokens/app_text_styles.dart';

/// A widget that displays a list of categories using a carousel.
///
/// The [Categories] widget fetches category data from a [CategoryProvider]
/// and displays them using a [ChipsCarousel]. It also provides a title
/// for the list of categories.
class Categories extends StatefulWidget {
  /// The provider for product data.
  final ProductProvider productProvider;

  /// Creates a [Categories] widget.
  ///
  /// The [productProvider] parameter is required.
  const Categories({Key? key, required this.productProvider}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  void initState() {
    super.initState();
    final categoryProvider = Provider.of<CategoryProvider>(context, listen: false);
    categoryProvider.getAllCategories();
  }

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);

    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.small),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: AppSpacing.small),
            child: Text(
              'Categories',
              style: AppTextStyles.subtitle,
            ),
          ),

          if (categoryProvider.isLoading) const CategoriesSkeleton(),

          if (!categoryProvider.isLoading)
            ChipsCarousel(
              chips: categoryProvider.createCarouselChips(
                context: context,
                productProvider: widget.productProvider,
              ),
            ),
        ],
      ),
    );
  }
}

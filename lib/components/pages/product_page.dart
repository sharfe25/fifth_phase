import 'package:connect_fake_store/models/product_model.dart';
import 'package:ecommerce_design_system_package/ecommerce_design_system_package.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/product_provider.dart';
import '../tokens/app_colors.dart';
import '../tokens/app_spacing.dart';
import '../tokens/app_text_styles.dart';

/// A screen that displays detailed information about a specific product.
///
/// The [ProductPage] widget retrieves product details from a [ProductProvider]
/// and displays them using various UI elements like images, text, and chips.
class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductProvider productProvider =
        Provider.of<ProductProvider>(context, listen: false);

    ProductModel product =
        productProvider.productSelected ?? ProductModel.empty();

    return DashboardTemplate(
      onTapBack: () => Navigator.pop(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 200,
                margin: const EdgeInsets.symmetric(vertical: AppSpacing.medium),
                padding: const EdgeInsets.symmetric(vertical: AppSpacing.large),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: product.image.isNotEmpty
                    ? Image.network(
                        product.image,
                        fit: BoxFit.contain,
                      )
                    : const SizedBox.shrink(),
              ),
            ),
            Text(
              product.title,
              style: AppTextStyles.title.copyWith(fontSize: 17),
            ),
            const SizedBox(
              height: AppSpacing.small,
            ),
            Text(
              '\$${product.price.toString()}',
              style: AppTextStyles.subtitle.copyWith(fontSize: 16),
            ),
            const SizedBox(
              height: AppSpacing.large,
            ),
            Text(
              'Description',
              style: AppTextStyles.body
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            const SizedBox(
              height: AppSpacing.small,
            ),
            Text(
              product.description,
              style: AppTextStyles.body,
            ),
            const SizedBox(
              height: AppSpacing.large,
            ),
            Text(
              'Category',
              style: AppTextStyles.body
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            const SizedBox(
              height: AppSpacing.small,
            ),
            SizedBox(
              width: 150,
              child: ChipWidget(
                chipData: ChipModel(
                  title: product.category,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

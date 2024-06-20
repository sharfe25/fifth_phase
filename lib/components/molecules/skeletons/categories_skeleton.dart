import 'package:ecommerce_design_system_package/ecommerce_design_system_package.dart';
import 'package:flutter/material.dart';

import '../../tokens/app_spacing.dart';

/// A stateless widget that displays a skeleton placeholder for category items.
class CategoriesSkeleton extends StatelessWidget {
  /// Creates a [CategoriesSkeleton] widget.
  const CategoriesSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: AppSpacing.small),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SkeletonWidget(height: 35, width: 80),
          SizedBox(
            width: AppSpacing.medium,
          ),
          SkeletonWidget(height: 35, width: 80),
        ],
      ),
    );
  }
}

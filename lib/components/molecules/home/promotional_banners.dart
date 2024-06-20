import 'package:flutter/material.dart';

import '../../atoms/promotional_banner.dart';
import '../../tokens/app_spacing.dart';

/// A stateless widget that displays a list of promotional banners.
class PromotionalBanners extends StatelessWidget {
  /// Creates a [PromotionalBanners] widget.
  const PromotionalBanners({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.small),
      height: 150,
      child: ListView.separated(
        itemCount: 3,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: AppSpacing.medium,
          );
        },
        itemBuilder: (context, index) {
          return const PromotionalBanner();
        },
      ),
    );
  }
}

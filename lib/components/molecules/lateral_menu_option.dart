import 'package:flutter/material.dart';

import '../../providers/lateral_menu_provider.dart';
import '../tokens/app_colors.dart';
import '../tokens/app_spacing.dart';
import '../tokens/app_text_styles.dart';

/// A stateless widget that displays an option in the lateral menu.
class LateralMenuOption extends StatelessWidget {
  /// The text to display for the menu option.
  final String text;

  /// The callback function to execute when the menu option is tapped.
  final VoidCallback? onTap;

  /// The provider for managing the state of the lateral menu.
  final LateralMenuProvider lateralMenuProvider;

  /// Creates a [LateralMenuOption] widget.
  const LateralMenuOption({
    Key? key,
    required this.text,
    this.onTap,
    required this.lateralMenuProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
        lateralMenuProvider.displayMenu(showMenuValue: false);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 20.0, vertical: AppSpacing.xSmall),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style:
                  AppTextStyles.subtitle.copyWith(color: AppColors.blackColor),
            ),
            const Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }
}

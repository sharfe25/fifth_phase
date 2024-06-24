import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_spacing.dart';

/// A class that defines custom text styles for the application.
class AppTextStyles {

  static const TextStyle title = TextStyle(
    fontSize: AppSpacing.xLarge,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: AppSpacing.large,
    fontWeight: FontWeight.w500,
    color: AppColors.subtitleColor,
  );

  static const TextStyle body = TextStyle(
    fontSize: AppSpacing.medium,
  );

  static const TextStyle chip = TextStyle(
    fontSize: AppSpacing.medium,
    color: AppColors.whiteColor,
    fontWeight: FontWeight.bold,
  );
}

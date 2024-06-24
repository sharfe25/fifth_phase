import 'package:ecommerce_design_system_package/ecommerce_design_system_package.dart';
import 'package:flutter/material.dart';

import '../tokens/app_colors.dart';
import '../tokens/app_spacing.dart';
import '../tokens/app_text_styles.dart';

/// A stateless widget that displays the Contact Us page.
///
/// The [ContactUsPage] widget provides information about contacting the business,
/// including office address and contact details.
class ContactUsPage extends StatelessWidget {
  const ContactUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DashboardTemplate(
      title: 'Contact Us',
      onTapBack: () => Navigator.pop(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CardContainer(
              title: 'Contact Us',
              subtitle: 'Fast and real time responses',
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.medium),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: AppSpacing.large,
                  ),
                  Text(
                    'Office address',
                    style: AppTextStyles.subtitle.copyWith(color: AppColors.blackColor),
                  ),
                  const SizedBox(
                    height: AppSpacing.small,
                  ),
                  const Text('First Floor, 25 St Stephens Green, Dublin 2, Ireland.'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

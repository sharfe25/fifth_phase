import 'package:ecommerce_design_system_package/ecommerce_design_system_package.dart';
import 'package:fifth_phase/components/pages/contact_us_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Contact Us Page Widget Tests', () {
    testWidgets('renders ContactUsPage correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: ContactUsPage(),
        ),
      );

      expect(find.text('Contact Us'), findsWidgets);
      expect(find.byType(CardContainer), findsOneWidget);
    });
  });
}

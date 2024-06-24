import 'package:fifth_phase/utils/alerts_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AlertUtils >', () {
    testWidgets('Display snack bar correctly', (WidgetTester tester) async {
      late BuildContext contextTmp;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(builder: (BuildContext context) {
              contextTmp = context;
              return const SizedBox.shrink();
            }),
          ),
        ),
      );

      AlertUtils.showGeneralSnackBar(contextTmp, 'Message test');
      await tester.pumpAndSettle();
      expect(find.text('Message test'), findsWidgets);
    });
  });
}

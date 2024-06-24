import 'package:fifth_phase/providers/lateral_menu_provider.dart';
import 'package:fifth_phase/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  group('LateralMenuProvider', () {
    late LateralMenuProvider lateralMenuProvider;


    setUp(() {
      lateralMenuProvider = LateralMenuProvider();
    });

    test('initial values are correct', () {
      expect(lateralMenuProvider.showMenu, false);
    });

    testWidgets('getMenuOptions returns correct menu options', (WidgetTester tester) async{
      late BuildContext contextTmp;
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => LateralMenuProvider()),
          ],
          child: MaterialApp(
            routes: routes,
            home: Builder(
              builder: (BuildContext context) {
                contextTmp = context;
                return const SizedBox.shrink();
              },
            ),
          ),
        ),
      );
      
      final options = lateralMenuProvider.getMenuOptions(context: contextTmp);

      expect(options.length, 1);
      expect(options.first.title, 'Contact us');
      expect(options.first.onTap, isNotNull);
    });

    test('displayMenu sets _showMenu and calls notifyListeners', () {
      bool listenerCalled = false;
      lateralMenuProvider.addListener(() {
        listenerCalled = true;
      });

      lateralMenuProvider.displayMenu(showMenuValue: true);
      expect(lateralMenuProvider.showMenu, true);
      expect(listenerCalled, true);

      listenerCalled = false;
      lateralMenuProvider.displayMenu(showMenuValue: false);
      expect(lateralMenuProvider.showMenu, false);
      expect(listenerCalled, true);
    });

    test('clearProvider resets _showMenu', () {
      lateralMenuProvider.displayMenu(showMenuValue: true);
      expect(lateralMenuProvider.showMenu, true);

      lateralMenuProvider.clearProvider();
      expect(lateralMenuProvider.showMenu, false);
    });
  });
}

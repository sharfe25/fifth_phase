import 'package:ecommerce_design_system_package/controller/lateral_menu_controller.dart';
import 'package:ecommerce_design_system_package/models/menu_option_model.dart';
import 'package:flutter/material.dart';

/// A provider class for managing lateral menu animations and state.
class LateralMenuProvider extends LateralMenuController with ChangeNotifier {
  bool _showMenu = false;

  bool get showMenu => _showMenu;

  List<MenuOptionModel> getMenuOptions({required BuildContext context}) {
    return [
      MenuOptionModel(
          title: 'Contact us',
          onTap: () {
            Navigator.pushNamed(
              context,
              '/contact_us',
            );
          })
    ];
  }

  void displayMenu({required bool showMenuValue}) {
    _showMenu = showMenuValue;
    notifyListeners();
  }

  void clearProvider() {
    _showMenu = false;
  }
}

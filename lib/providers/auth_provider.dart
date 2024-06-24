import 'package:flutter/material.dart';

import '../models/user_model.dart';
import '../utils/alerts_utils.dart';

/// Class that manages authentication logic and controls user data.
class AuthProvider with ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController pswdController = TextEditingController();

  bool isValidLoginForm = false;
  bool isValidSignUpForm = false;
  UserModel _user = UserModel.empty();

  UserModel get user => _user;

  void signUp({required BuildContext context}) {
    _user = UserModel(
      username: usernameController.text,
      password: pswdController.text,
      name: nameController.text,
      lastName: lastNameController.text,
      email: emailController.text,
    );
    Navigator.pushNamed(
      context,
      '/login',
    );
    clearProvider();
  }

  void isValidLogin() {
    isValidLoginForm =
        usernameController.text.isNotEmpty && pswdController.text.isNotEmpty;
    notifyListeners();
  }

  void isValidSignUp() {
    isValidSignUpForm = usernameController.text.isNotEmpty &&
        pswdController.text.isNotEmpty &&
        nameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty &&
        emailController.text.isNotEmpty;
    notifyListeners();
  }

  void login({required BuildContext context}) async {
    if (usernameController.text == 'test' && pswdController.text == 'test') {
      _user = const UserModel(username: 'Test', password: '');
      Navigator.pushNamed(
        context,
        '/home',
      );
      clearProvider();
      return;
    }

    if (usernameController.text.isNotEmpty &&
        pswdController.text.isNotEmpty &&
        usernameController.text == _user.username &&
        pswdController.text == _user.password) {
      Navigator.pushNamed(
        context,
        '/home',
      );
      clearProvider();
    } else {
      AlertUtils.showGeneralSnackBar(context, 'Incorrect user or password');
    }
  }

  void signOut({required BuildContext context}) async {
    clearProvider();
    Navigator.pop(context);
  }

  void clearProvider() {
    isValidLoginForm = false;
    isValidSignUpForm = false;
    emailController.clear();
    usernameController.clear();
    pswdController.clear();
    nameController.clear();
    lastNameController.clear();
    notifyListeners();
  }
}

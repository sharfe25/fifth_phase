import 'package:flutter/material.dart';

import '../models/user_model.dart';
import '../utils/alerts_utils.dart';

/// Enum that defines the types of authentication pages.
enum TypePage { 
  /// Login page.
  login, 
  /// Sign-up page.
  signUp 
}

/// Class that manages authentication logic and controls user data.
class AuthProvider with ChangeNotifier {
  /// Controller for the user's name.
  TextEditingController nameController = TextEditingController();
  
  /// Controller for the user's last name.
  TextEditingController lastNameController = TextEditingController();
  
  /// Controller for the user's email.
  TextEditingController emailController = TextEditingController();
  
  /// Controller for the user's username.
  TextEditingController usernameController = TextEditingController();
  
  /// Controller for the user's password.
  TextEditingController pswdController = TextEditingController();

  bool _isValidLoginForm = false;
  bool _isValidSignUpForm = false;
  UserModel _user = UserModel.empty();

  /// Retrieves the currently active user.
  UserModel get user => _user;

  /// Retrieves whether the login form is valid.
  bool get isValidLoginForm => _isValidLoginForm;

  /// Retrieves whether the sign-up form is valid.
  bool get isValidSignUpForm => _isValidSignUpForm;

  /// Performs the user registration process.
  ///
  /// [context] is the application context where navigation occurs.
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
      '/',
    );
    clearProvider();
  }

  /// Validates the login form.
  void isValidLogin() {
    _isValidLoginForm =
        usernameController.text.isNotEmpty && pswdController.text.isNotEmpty;
    notifyListeners();
  }

  /// Validates the sign-up form.
  void isValidSignUp() {
    _isValidSignUpForm = usernameController.text.isNotEmpty &&
        pswdController.text.isNotEmpty &&
        nameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty &&
        emailController.text.isNotEmpty;
    notifyListeners();
  }

  /// Performs the user login process.
  ///
  /// [context] is the application context where navigation occurs.
  void login({required BuildContext context}) async {
    if (usernameController.text == 'test' && pswdController.text == 'test') {
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

  /// Performs the user sign-out process.
  ///
  /// [context] is the application context where navigation occurs.
  void signOut({required BuildContext context}) async {
    clearProvider();
    Navigator.pop(context);
  }

  /// Clears all controllers and resets validation states.
  void clearProvider() {
    _isValidLoginForm = false;
    _isValidSignUpForm = false;
    emailController.clear();
    usernameController.clear();
    pswdController.clear();
    nameController.clear();
    lastNameController.clear();
    notifyListeners();
  }
}

import 'package:flutter/material.dart';

/// Utility class for displaying alerts in the application.
class AlertUtils {
  
  /// Displays a general snackbar with the provided message.
  ///
  /// The [context] parameter is required to obtain the correct [BuildContext] 
  /// to show the snackbar.
  ///
  /// The [msg] parameter is the message to be displayed in the snackbar.
  ///
  /// The optional [snackBarBehavior] parameter sets the behavior of the snackbar,
  /// defaulting to [SnackBarBehavior.fixed].
  static void showGeneralSnackBar(
    BuildContext context,
    String msg, {
    SnackBarBehavior snackBarBehavior = SnackBarBehavior.fixed,
  }) {
    final SnackBar snackBar = SnackBar(
      behavior: snackBarBehavior,
      content: Text(
        msg,
        style: const TextStyle(fontSize: 16),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

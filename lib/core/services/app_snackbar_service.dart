import 'package:flutter/material.dart';
import '../../globals.dart';
import '../theme/app_theme.dart';

class AppSnackbarService {
  static void showSnackbar(String text) {
    snackbarKey.currentState
      ?..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(text),
          backgroundColor: AppThemes.primaryColor,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // optional rounded corners
          ),
        ),
      );
  }
}

import 'dart:async';
class AppValidationService {
  static String? validateRequired(String? value, {String fieldName = "Field"}) {
    if (value == null || value.trim().isEmpty) {
      return "$fieldName is required.";
    }
    return null;
  }

  static String? validateEmail(
      String? value, {
        bool isRequired = true,
      }) {
    if (!isRequired && (value == null || value.trim().isEmpty)) {
      return null;
    }

    if (value == null || value.trim().isEmpty) {
      return "Email is required.";
    }

    final emailRegex = RegExp(
      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
    );

    if (!emailRegex.hasMatch(value.trim())) {
      return "Please enter a valid email address.";
    }

    return null;
  }


  static String? validatePassword(String? value, {int minLength = 8}) {
    if (value == null || value.isEmpty) {
      return "Password is required.";
    }

    if (value.length < minLength) {
      return "Password must be at least $minLength characters.";
    }

    return null;
  }
  static String? validateConfirmPassword(
      String? value,
      String? originalPassword,
      ) {
    if (value == null || value.trim().isEmpty) {
      return "Please confirm your password.";
    }

    if (originalPassword != value.trim()) {
      return "Passwords do not match.";
    }

    return null;
  }
}

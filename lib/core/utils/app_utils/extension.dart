import 'package:flutter/material.dart';

extension StringValidation on String {
  // Validates email
  bool get isValidEmail {
    final emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    return emailRegex.hasMatch(this);
  }

  // Validates phone number (10 digits)
  bool get isValidPhoneNumber {
    final phoneRegex = RegExp(r"^[0-9]{8,15}$");
    return phoneRegex.hasMatch(this);
  }

  // Validates first and last names (alphabets only, no numbers or special characters)
  bool get isValidName {
    final nameRegex = RegExp(r"^[A-Za-z ]{2,50}$");
    return nameRegex.hasMatch(this);
  }

  // Validates Date of Birth in 'dd/mm/yyyy' format
  bool get isValidDOB {
    final dobRegex = RegExp(
      r"^([0-2][0-9]|3[0-1])/(0[1-9]|1[0-2])/([0-9]{4})$",
    );
    if (!dobRegex.hasMatch(this)) return false;

    try {
      final parts = split('/');
      final day = int.parse(parts[0]);
      final month = int.parse(parts[1]);
      final year = int.parse(parts[2]);

      final date = DateTime(year, month, day);
      return date.day == day && date.month == month && date.year == year;
    } catch (e) {
      return false;
    }
  }
}

extension PasswordValidationWithError on String {
  /// Checks if the password is valid.
  bool get isValidPassword => getPasswordErrorMessage == null;

  /// Returns an error message if the password is invalid, or null if valid.
  String? get getPasswordErrorMessage {
    if (length < 8) {
      return "Password must be at least 8 characters long.";
    }
    if (!contains(RegExp(r'[A-Z]'))) {
      return "Password must include at least one uppercase letter.";
    }
    if (!contains(RegExp(r'[a-z]'))) {
      return "Password must include at least one lowercase letter.";
    }
    if (!contains(RegExp(r'[0-9]'))) {
      return "Password must include at least one number.";
    }
    if (!contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return "Password must include at least one special character.";
    }
    return null;
  }
}

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension MediaQueryExtension on BuildContext {
  double get screenHeight => mediaQuery.size.height;
  double get screenWidth => mediaQuery.size.width;
}

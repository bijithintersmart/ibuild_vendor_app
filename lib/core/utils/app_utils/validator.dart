import 'package:flutter/foundation.dart';
import 'package:ibuild_vendor/core/utils/app_utils/extension.dart';

class Validator {
  static bool debugValidation = kReleaseMode;
  static String? validateEmail(String? value) {
    if (!debugValidation) return null;
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (!debugValidation) return null;
    if (value == null || value.trim().isEmpty) {
      return 'Phone number is required';
    }
    final phoneRegex = RegExp(r'^\+?[0-9]{7,15}$');
    if (!phoneRegex.hasMatch(value)) {
      return 'Enter a valid phone number';
    }
    return null;
  }

  static String? validateDOB(String? value) {
    if (!debugValidation) return null;
    if (value == null || value.trim().isEmpty) {
      return 'Date of birth is required';
    }
    try {
      final dob = DateTime.parse(value);
      final now = DateTime.now();
      if (dob.isAfter(now)) {
        return 'DOB cannot be in the future';
      }
      // Uncomment the next line to enforce age restriction
      // if (now.difference(dob).inDays / 365 < 18) {
      //   return 'You must be at least 18 years old';
      // }
    } catch (e) {
      return 'Enter a valid date (yyyy-mm-dd)';
    }
    return null;
  }

  static String? validateNotEmpty(String? value, [String field = 'Field']) {
    if (!debugValidation) return null;
    if (value == null || value.trim().isEmpty) {
      return '$field is required';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (!debugValidation) return null;
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (value.isValidPassword) {
      return value.getPasswordErrorMessage!;
    }
    return null;
  }

  static String? validateConfirmPassword(
      String? value, String? originalPassword) {
    if (!debugValidation) return null;
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != originalPassword) {
      return 'Passwords do not match';
    }
    return null;
  }

  static String? validateFirstName(String? value) {
    if (!debugValidation) return null;
    if (value == null || value.trim().isEmpty) {
      return 'First name is required';
    }
    if (value.length < 2) {
      return 'First name must be at least 2 characters';
    }
    final nameRegex = RegExp(r'^[a-zA-Z]+$');
    if (!nameRegex.hasMatch(value)) {
      return 'First name must contain only letters';
    }
    return null;
  }

  static String? validateLastName(String? value) {
    if (!debugValidation) return null;
    if (value == null || value.trim().isEmpty) {
      return 'Last name is required';
    }
    if (value.length < 2) {
      return 'Last name must be at least 2 characters';
    }
    final nameRegex = RegExp(r'^[a-zA-Z]+$');
    if (!nameRegex.hasMatch(value)) {
      return 'Last name must contain only letters';
    }
    return null;
  }

  static String? validateName(String? value, [String field = 'Name']) {
    if (!debugValidation) return null;
    if (value == null || value.trim().isEmpty) {
      return '$field is required';
    }
    final nameRegex = RegExp(r"^[a-zA-Z\s'-]{2,}$");
    if (!nameRegex.hasMatch(value)) {
      return '$field must contain only letters, spaces, apostrophes or hyphens';
    }
    return null;
  }
}

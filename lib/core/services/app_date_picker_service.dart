import 'package:flutter/material.dart';

enum DatePickerType {
  /// Default date picker - allows dates from 1900 to 10 years in future
  standard,

  /// Only past dates allowed (no future dates)
  pastOnly,

  /// Only future dates allowed (no past dates)
  futureOnly,

  /// Birth date picker - user must be 18+ years old
  birthDate,

  /// Document expiry date - only future dates from today
  expiryDate,

  /// Document issue date - only past dates up to today
  issueDate,

  /// License expiry - future dates starting from today
  licenseExpiry,

  /// Vehicle registration date - past dates only
  registrationDate,
}

class AppDatePickerService {
  /// Pick a date based on the specified DatePickerType
  ///
  /// [context] - BuildContext required for showDatePicker
  /// [type] - Type of date picker configuration (defaults to standard)
  /// [customInitialDate] - Override the default initial date
  /// [customFirstDate] - Override the default first date
  /// [customLastDate] - Override the default last date
  static Future<DateTime?> pickDate(
      BuildContext context, {
        DatePickerType type = DatePickerType.standard,
        DateTime? customInitialDate,
        DateTime? customFirstDate,
        DateTime? customLastDate,
      }) async {
    final now = DateTime.now();
    DateTime initialDate;
    DateTime firstDate;
    DateTime lastDate;

    switch (type) {
      case DatePickerType.standard:
        initialDate = customInitialDate ?? now;
        firstDate = customFirstDate ?? DateTime(1900);
        lastDate = customLastDate ?? now.add(Duration(days: 3650)); // 10 years
        break;

      case DatePickerType.pastOnly:
        initialDate = customInitialDate ?? now;
        firstDate = customFirstDate ?? DateTime(1900);
        lastDate = customLastDate ?? now;
        break;

      case DatePickerType.futureOnly:
        initialDate = customInitialDate ?? now.add(Duration(days: 1));
        firstDate = customFirstDate ?? now;
        lastDate = customLastDate ?? now.add(Duration(days: 3650)); // 10 years
        break;

      case DatePickerType.birthDate:
      // User must be 18+ years old
        final eighteenYearsAgo = DateTime(now.year - 18, now.month, now.day);
        final maxAge = DateTime(now.year - 100, now.month, now.day); // 100 years max age
        initialDate = customInitialDate ?? eighteenYearsAgo;
        firstDate = customFirstDate ?? maxAge;
        lastDate = customLastDate ?? eighteenYearsAgo;
        break;

      case DatePickerType.expiryDate:
      // Document expiry - must be in future
        initialDate = customInitialDate ?? now.add(Duration(days: 365)); // 1 year default
        firstDate = customFirstDate ?? now;
        lastDate = customLastDate ?? now.add(Duration(days: 3650)); // 10 years
        break;

      case DatePickerType.issueDate:
      // Document issue date - must be in past
        initialDate = customInitialDate ?? now;
        firstDate = customFirstDate ?? DateTime(1900);
        lastDate = customLastDate ?? now;
        break;

      case DatePickerType.licenseExpiry:
      // License expiry - future dates only
        initialDate = customInitialDate ?? now.add(Duration(days: 1825)); // 5 years default
        firstDate = customFirstDate ?? now;
        lastDate = customLastDate ?? now.add(Duration(days: 7300)); // 20 years
        break;

      case DatePickerType.registrationDate:
      // Vehicle registration - past dates only
        initialDate = customInitialDate ?? now;
        firstDate = customFirstDate ?? DateTime(1950); // Cars from 1950 onwards
        lastDate = customLastDate ?? now;
        break;
    }

    // Ensure initialDate is within the valid range
    if (initialDate.isBefore(firstDate)) {
      initialDate = firstDate;
    } else if (initialDate.isAfter(lastDate)) {
      initialDate = lastDate;
    }

    return await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
      helpText: _getHelpText(type),
      cancelText: 'Cancel',
      confirmText: 'Select',
    );

  }


  static String _getHelpText(DatePickerType type) {
    switch (type) {
      case DatePickerType.birthDate:
        return 'Select Date of Birth (Must be 18+)';
      case DatePickerType.expiryDate:
        return 'Select Expiry Date';
      case DatePickerType.issueDate:
        return 'Select Issue Date';
      case DatePickerType.licenseExpiry:
        return 'Select License Expiry Date';
      case DatePickerType.registrationDate:
        return 'Select Registration Date';
      case DatePickerType.pastOnly:
        return 'Select Date (Past Only)';
      case DatePickerType.futureOnly:
        return 'Select Date (Future Only)';
      case DatePickerType.standard:
      default:
        return 'Select Date';
    }
  }

  /// Helper method to format date to readable string
  static String formatDate(DateTime? date) {
    if (date == null) return '';
    return '${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.year}';
  }

  /// Check if a person is 18+ years old
  static bool isEighteenOrOlder(DateTime birthDate) {
    final now = DateTime.now();
    final eighteenYearsAgo = DateTime(now.year - 18, now.month, now.day);
    return birthDate.isBefore(eighteenYearsAgo) || birthDate.isAtSameMomentAs(eighteenYearsAgo);
  }

  /// Check if date is expired
  static bool isExpired(DateTime expiryDate) {
    return expiryDate.isBefore(DateTime.now());
  }

}
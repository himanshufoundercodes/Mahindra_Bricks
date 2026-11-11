import 'dart:convert';
import 'package:intl/intl.dart';

class DataFormatter {
  DataFormatter._();

  // ---------------- DATE PARSING ----------------

  static DateTime? parseDate(dynamic value) {
    try {
      if (value == null) return null;

      if (value is DateTime) return value;

      if (value is int || value is double) {
        final timestamp = (value as num).toInt();

        final milliseconds = timestamp.abs() < 100000000000
            ? timestamp * 1000
            : timestamp;

        return DateTime.fromMillisecondsSinceEpoch(
          milliseconds,
          isUtc: true,
        );
      }

      if (value is String) {
        final input = value.trim();

        if (input.isEmpty) return null;

        if (RegExp(r'^\d+$').hasMatch(input)) {
          return parseDate(int.tryParse(input));
        }

        return DateTime.tryParse(input);
      }

      return null;
    } catch (_) {
      return null;
    }
  }

  // ---------------- CUSTOM DATE FORMAT ----------------

  static String customDate(
      dynamic value, {
        String format = 'dd-MM-yyyy',
        bool utc = false,
      }) {
    try {
      final date = parseDate(value);

      if (date == null) return '-';

      final result = utc ? date.toUtc() : date.toLocal();

      // No explicit locale: uses default intl locale.
      return DateFormat(format).format(result);
    } catch (_) {
      return '-';
    }
  }

  // ---------------- DATE FORMATS ----------------

  static String date(dynamic value) =>
      customDate(value, format: 'dd-MM-yyyy');

  static String dateShort(dynamic value) =>
      customDate(value, format: 'dd MMM yyyy');

  static String dateLong(dynamic value) =>
      customDate(value, format: 'EEEE, dd MMMM yyyy');

  static String dateWithMonth(dynamic value) =>
      customDate(value, format: 'dd MMMM yyyy');

  static String dateSlash(dynamic value) =>
      customDate(value, format: 'dd/MM/yyyy');

  static String dateISO(dynamic value) =>
      customDate(value, format: 'yyyy-MM-dd');

  // ---------------- TIME FORMATS ----------------

  static String time(dynamic value) =>
      customDate(value, format: 'hh:mm a');

  static String time24(dynamic value) =>
      customDate(value, format: 'HH:mm');

  static String timeWithSeconds(dynamic value) =>
      customDate(value, format: 'hh:mm:ss a');

  static String dateTime(dynamic value) =>
      customDate(value, format: 'dd MMM yyyy, hh:mm a');

  static String dateTimeLong(dynamic value) =>
      customDate(value, format: 'EEEE, dd MMMM yyyy hh:mm a');

  static String dateTime24(dynamic value) =>
      customDate(value, format: 'dd-MM-yyyy HH:mm:ss');
  static String relative(dynamic value) {
    final date = parseDate(value);

    if (date == null) return '-';

    final difference = DateTime.now().difference(date.toLocal());

    if (difference.inSeconds < 0) {
      return 'In ${difference.inMinutes.abs()} minutes';
    }

    if (difference.inSeconds < 60) return 'Just now';

    if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minutes ago';
    }

    if (difference.inHours < 24) {
      return '${difference.inHours} hours ago';
    }

    if (difference.inDays == 1) return 'Yesterday';

    if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    }

    return dateShort(value);
  }

  static String number(
      num? value, {
        int decimalDigits = 2,
      }) {
    if (value == null) return '-';

    try {
      return NumberFormat(
        '#,##,##0.${'0' * decimalDigits}',
      ).format(value);
    } catch (_) {
      return value.toString();
    }
  }
  static String currency(
      num? value, {
        String symbol = '₹',
        int decimalDigits = 2,
      }) {
    if (value == null) return '-';

    try {
      return NumberFormat.currency(
        locale: 'en_IN',
        symbol: symbol,
        decimalDigits: decimalDigits,
      ).format(value);
    } catch (_) {
      return '$symbol$value';
    }
  }
  static String percentage(
      num? value, {
        int decimalDigits = 2,
      }) {
    if (value == null) return '-';

    return '${value.toStringAsFixed(decimalDigits)}%';
  }

  static String json(dynamic value) {
    if (value == null) return '-';

    try {
      final decoded = value is String
          ? jsonDecode(value)
          : value;

      return const JsonEncoder.withIndent('  ').convert(decoded);
    } catch (_) {
      return value.toString();
    }
  }
  static String display(
      dynamic value, {
        String? format,
      }) {
    if (value == null) return '-';

    if (value is DateTime) {
      return customDate(
        value,
        format: format ?? 'dd MMM yyyy, hh:mm a',
      );
    }

    if (value is int || value is double) {
      return value.toString();
    }

    if (value is Map || value is List) {
      return json(value);
    }

    if (value is String) {
      final date = parseDate(value);

      if (date != null) {
        return customDate(
          date,
          format: format ?? 'dd MMM yyyy, hh:mm a',
        );
      }

      return value;
    }

    return value.toString();
  }
}
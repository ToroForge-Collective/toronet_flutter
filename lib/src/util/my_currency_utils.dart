import 'package:intl/intl.dart';

class MyCurrencyUtils{

  static String formatCurrency(double amount) {
    return NumberFormat.currency(
        locale: "en_US",
        symbol: "\$",
        decimalDigits: 2
    ).format(amount);
  }
  static String format(double amount,int decimal) {
    return NumberFormat.currency(
        locale: "en_US",
        symbol: "",
        decimalDigits: decimal
    ).format(amount);
  }

  static String formatCurrency2(double value) {
    // Remove trailing zeros and the decimal point if not needed
    return value.toStringAsFixed(6).replaceFirst(RegExp(r'\.?0+$'), '');
  }
}
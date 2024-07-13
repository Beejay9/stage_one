import 'package:intl/intl.dart';

String get getCurrency {
    var format = NumberFormat.simpleCurrency();
    return format.simpleCurrencySymbol('NGN');
  }
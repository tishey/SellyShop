
import 'package:intl/intl.dart';

String nairaFormat(num? value, int? decimal) {
  return NumberFormat.currency(
          locale: 'en_NG', decimalDigits: decimal ?? 2, symbol: '')
      .format(value);
}

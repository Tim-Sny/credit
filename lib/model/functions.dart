import 'package:intl/intl.dart';

// var _currFormat = NumberFormat.simpleCurrency(
//   locale: 'ru',
//   decimalDigits: 0,
// );

// String RubRemove(String line) {
//   String _res;
//   _res = line.replaceAll(RegExp(r' руб.'), '');
//   return _res;
// }

String formatCurrencyString(double sum, {int precision = 2}) {
  String formStr = '#,###';
  for (int i = 0; i < precision; i++) {
    if (i == 0) {
      formStr = formStr + ".";
    }
    formStr = formStr + "0";
  }
  return new NumberFormat(formStr)
      .format(double.parse(sum.toStringAsFixed(precision)))
      .replaceAll(RegExp(r','), ' ');
}

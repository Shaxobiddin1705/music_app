import 'dart:math' as math;

extension IntegerExtensions on int {
  int separatedViewLength() {
    return math.max(0, this * 2 - 1);
  }
}

extension CurrencyExt on num {
  /// Removes unnecessary zeros from the end of double type number
  String toFixedString(int fractionDigits) {
    String str = toString();
    final decimalPointIndex = str.indexOf('.');
    if (decimalPointIndex != -1 &&
        str.length > decimalPointIndex + fractionDigits) {
      str = str.substring(0, str.length - fractionDigits - 1);
    } else {
      str = toStringAsFixed(fractionDigits);
    }
    final result = double.parse(str);
    return result.toString();
  }

  bool get isInteger => (this % 1) == 0;
}

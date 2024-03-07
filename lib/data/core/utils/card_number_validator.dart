import 'dart:math' as math;

import 'package:music_app/data/core/app_extensions/int_ext.dart';

int? maxLengthUIPriceField({
  required int? maxLength,
  required int currencyLength,
}) {
  if (maxLength != null) {
    int spaceCount = 0;
    final space = maxLength / 3;
    if (space.isInteger) {
      spaceCount = math.max(space.toInt() - 1, 0);
    } else {
      spaceCount = space.floor();
    }
    return maxLength + currencyLength + spaceCount;
  } else {
    return null;
  }
}

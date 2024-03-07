enum DateTimeParam {
  dateMonthYear,
  monthYear,
  year,
}

extension DateTimeExtensions on DateTime {
  DateTime get toTashkentTimeZone => toUtc().add(const Duration(hours: 5));

  DateTime get fromDayStart => DateTime(year, month, day);

  DateTime get dayBefore {
    final yesterday = subtract(const Duration(days: 1));
    return DateTime(yesterday.year, yesterday.month, yesterday.day, 23, 59, 59);
  }

  DateTime get tillDayEnd {
    final now = DateTime.now();
    final currentDate = DateTime(now.year, now.month, now.day);
    final testDate = DateTime(year, month, day);
    final isSame = currentDate.isSameDate(testDate);
    if (isSame) {
      return now;
    }
    return DateTime(year, month, day, 23, 59, 59);
  }

  DateTime get weeklyDate {
    final weekDay = weekday;
    return subtract(Duration(days: weekDay - 1));
  }

  DateTime get monthlyDate {
    return DateTime(year, month);
  }

  bool isSameDate(DateTime other,
      {DateTimeParam param = DateTimeParam.dateMonthYear}) {
    switch (param) {
      case DateTimeParam.dateMonthYear:
        return day == other.day && month == other.month && year == other.year;
      case DateTimeParam.monthYear:
        return month == other.month && year == other.year;
      case DateTimeParam.year:
        return year == other.year;
    }
  }

  bool get isCurrentMonth {
    final now = DateTime.now();
    return month == now.month;
  }

  // String formatTime([String pattern = 'Hms']) {
  //   final formatter = DateFormat(pattern, LocaleKeys.lang.tr());
  //   return formatter.format(this);
  // }

  // String formatDate([String pattern = 'dd MMMM, y']) {
  //   final currentYear = DateTime.now().year;
  //   final shouldAddYear =
  //       currentYear != year && !pattern.contains('y') && !pattern.contains('Y');
  //   String result = DateFormat(pattern, LocalKeys.lang.tr()).format(this);
  //   if (shouldAddYear) {
  //     result += ', $year';
  //   }
  //   return result;
  // }
  //
  // /// Returns Today/Yesterday • dd.MM.yy if the date is today or yesterday.
  // /// Otherwise returns the formatted date itself
  // String toNamedDate([String pattern = 'dd MMMM, y']) {
  //   final formatted = formatDate(pattern);
  //   if (pattern.contains('MMMM')) {
  //     final month = formatted.replaceAll(RegExp(r'[^a-zA-Zа-яА-Я]'), '');
  //     final result = formatted.replaceAll(month, month.capitalize());
  //     return result;
  //   }

  // final now = DateTime.now();
  // final today = DateTime(now.year, now.month, now.day);
  // final yesterday = today.subtract(const Duration(days: 1));
  // final dateToCheck = DateTime(year, month, day);
  // if (dateToCheck == today) {
  //   return '${LocaleKeys.today.tr()} • $formatted';
  // }
  // if (dateToCheck == yesterday) {
  //   return '${LocaleKeys.yesterday.tr()} • $formatted';
  // }
  // return formatted;
  // }

  int get getDaysInMonth {
    if (month == DateTime.february) {
      final bool isLeapYear =
          (year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0);
      return isLeapYear ? 29 : 28;
    }
    const List<int> daysInMonth = <int>[
      31,
      -1,
      31,
      30,
      31,
      30,
      31,
      31,
      30,
      31,
      30,
      31
    ];
    return daysInMonth[month - 1];
  }
}

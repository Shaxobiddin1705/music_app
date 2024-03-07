extension StringExt on String {
  String? validatePassword() {
    if (length >= 8) {
      return null;
    }
    return 'Minimum password length is 8';
  }

  String cleanExtraElements() {
    var text = this;
    final index = text.indexOf("\$");
    if (index != -1) {
      text = text.substring(0, text.indexOf("\$"));
    }
    return text;
  }

  String formatAmount({bool haveLast = false}) {
    late final double number;
    if (contains(',')) {
      final str = replaceFirst(',', '.');
      number = double.parse(str);
    } else {
      number = double.parse(this);
    }
    final List<String> parts = number.toStringAsFixed(2).split('.');
    final String integerPart = parts[0];
    final String fractionalPart = parts[1];
    final List<String> integerParts = [];

    for (int i = integerPart.length - 1, j = 0; i >= 0; i--, j++) {
      if (j != 0 && j % 3 == 0) {
        integerParts.add(' ');
      }
      integerParts.add(integerPart[i]);
    }

    final String formattedIntegerPart = integerParts.reversed.join('');
    return haveLast
        ? '$formattedIntegerPart.$fractionalPart'
        : formattedIntegerPart;
  }

  double get doubleParse => double.tryParse(removeBlankSpaces()) ?? 0;

  int get intParse => int.tryParse(removeBlankSpaces()) ?? 0;

  String obscureCardNumber() => '* ${substring(length - 4, length)}';

  String removeBlankSpaces() => replaceAll(RegExp(r"\s+"), "");

  String getCardComparableParts() {
    late final String cardNumber;
    if (contains('*')) {
      cardNumber = removeBlankSpaces().replaceAll('*', '');
    } else {
      cardNumber = removeBlankSpaces().replaceRange(6, 12, '');
    }
    return cardNumber;
  }

  String formatCardNumber() {
    final number = replaceAll(' ', '');
    final buffer = StringBuffer();
    for (int i = 0; i < number.length; i++) {
      buffer.write(number[i]);
      if (i != 0 && (i + 1) % 4 == 0) {
        buffer.write(' ');
      }
    }
    return buffer.toString();
  }

  String toMonth() {
    final month =
        DateTime.fromMillisecondsSinceEpoch(int.parse(this) * 1000).month;
    if (month.toString().length > 1) {
      return '${DateTime.fromMillisecondsSinceEpoch(int.parse(this) * 1000).month}';
    } else {
      return '0${DateTime.fromMillisecondsSinceEpoch(int.parse(this) * 1000).month}';
    }
  }

  String toYear({bool isFull = false}) {
    final year =
        DateTime.fromMillisecondsSinceEpoch(int.parse(this) * 1000).year;
    if (isFull) return year.toString();
    return year.toString().substring(2);
  }
}

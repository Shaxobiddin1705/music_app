extension MyList on List {
  void addUnique(dynamic value) {
    for (int i = 0; i < length; i++) {
      if (this[i] == value) return;
    }
    add(value);
  }

  String dartContent() {
    var text = "$this";
    text = text.substring(1, text.length - 1);

    return """
import 'package:easy_localization/src/public_ext.dart';

extension MyWords on LocalKeys {
  String tr([dynamic key]) {
    return "\$name\${key == null ? "" : "\\\$\$key"}".tr();
  }
}

enum LocalKeys {$text}""";
  }
}
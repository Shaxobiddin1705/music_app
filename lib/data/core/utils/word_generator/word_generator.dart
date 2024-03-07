import 'dart:convert';
import 'dart:io';
import 'package:music_app/data/core/app_extensions/list_ext.dart';
import 'package:path/path.dart';

void main() async {
  try {
    final json = jsonDecode(await jsonFile.readAsString());
    await writeWordFile(json, dartFile);
    await writeWordJson(json, jsonFile);
    print("Success");
  } catch (e) {
    print("Error: $e");
  }
}

final jsonFile = File(join(Directory.current.path, 'assets/tr', 'ru.json'));
final dartFile = File(
  join(Directory.current.path, 'lib/app/design_system/const',
      'app_localization.dart'),
);

Future<void> writeWordFile(Map<String, dynamic> json, File file) async {
  final keys = <String>[];
  json.forEach(
    (key, value) => keys.addUnique(key.toCamelCase().cleanExtraElements()),
  );
  keys.sort();
  await file.writeAsString(keys.dartContent());
  print("write word file");
}

Future<void> writeWordJson(Map<String, dynamic> json, File file) async {
  final data = <String, dynamic>{};
  json.forEach((k, v) => data.addAll({'"${k.toCamelCase()}"': '"$v"'}));
  final list = data.entries.toList();
  list.sort(((a, b) => a.key.compareTo(b.key)));
  data.clear();
  for (var e in list) {
    data.addAll({e.key: e.value});
  }
  await file.writeAsString("$data");
  print("write json file");
}

extension StringGeneratorExt on String {
  String toCamelCase() {
    var data = toSnakeCase();
    var result = "";
    for (int i = 0; i < data.length; i++) {
      var temp = data[i];
      if (i > 0 && data[i - 1] == "_") {
        temp = data[i].toUpperCase();
      }
      result += temp;
    }
    return result.replaceAll("_", "");
  }

  String toSnakeCase() {
    var data = "";
    var result = "";

    if (!_hasLowerCase()) {
      return toLowerCase();
    }

    for (int i = 0; i < length; i++) {
      if (RegExp(r'^[A-Z]').hasMatch(this[i])) {
        data += "_";
      }
      data += this[i];
    }
    data = "_${data.toLowerCase()}_";

    for (int i = 1; i < data.length; i++) {
      if (data[i - 1] != "_" || data[i] != "_") {
        result += data[i];
      }
    }

    if (result[result.length - 1] == "_") {
      result = result.substring(0, result.length - 1);
    }
    return result;
  }

  bool _hasLowerCase() {
    for (int i = 0; i < length; i++) {
      if (RegExp(r'^[a-z]').hasMatch(this[i])) {
        return true;
      }
    }
    return false;
  }

  String cleanExtraElements() {
    var text = this;
    final index = text.indexOf("\$");
    if (index != -1) {
      text = text.substring(0, text.indexOf("\$"));
    }
    return text;
  }
}

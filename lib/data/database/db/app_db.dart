import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:music_app/data/database/database.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqlcipher_flutter_libs/sqlcipher_flutter_libs.dart';
import 'package:sqlite3/open.dart';

part 'app_db.g.dart';

@DriftDatabase(
  tables: [
    TrackEntity,
  ],
  daos: [
    TrackDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  static const dbKey = 'music_app_db';

  AppDatabase() : super(_openConnection(dbKey));

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => destructiveFallback;

  // call this method before using drift
  static Future<void> setupSqlCipher() async {
    if (Platform.isIOS) {
      open.overrideFor(OperatingSystem.iOS, DynamicLibrary.process);
    } else {
      await applyWorkaroundToOpenSqlCipherOnOldAndroidVersions();
      open.overrideFor(
        OperatingSystem.android,
        openCipherOnAndroid,
      );
    }
  }

  Future<void> deleteEverything() async {
    await customStatement('PRAGMA foreign_keys = OFF');
    try {
      await transaction(() async {
        for (final table in allTables) {
          await delete(table).go();
        }
      });
    } finally {
      await customStatement('PRAGMA foreign_keys = ON');
    }
  }
}

QueryExecutor _openConnection(String dbKey) {
  return LazyDatabase(() async {
    final hash = md5.convert(utf8.encode(dbKey));
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, '$hash.sqlite'));
    return NativeDatabase(
      file,
      // logStatements: true,
      setup: (database) {
        // Check that we're actually running with SQLCipher by quering the
        // cipher_version pragma.
        final result = database.select('pragma cipher_version');
        if (result.isEmpty) {
          throw UnsupportedError(
            'This database needs to run with SQLCipher, but that library is '
            'not available!',
          );
        }

        final escapedKey = dbKey.replaceAll("'", "''");
        database.execute("pragma key = '$escapedKey'");

        // Test that the key is correct by selecting from a table
        database.execute('select count(*) from sqlite_master');
      },
    );
  });
}

/// while executing, file is not a database, file is not a database (code 26)

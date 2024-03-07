import 'package:drift/drift.dart';

class TrackEntity extends Table {
  @override
  String? get tableName => 'track';

  @override
  Set<Column> get primaryKey => {id};

  IntColumn get id => integer()();

  TextColumn get title => text()();

  TextColumn get albumTitle => text()();

  BlobColumn get music => blob()();

  BlobColumn get image => blob()();

  TextColumn get artist => text()();
}

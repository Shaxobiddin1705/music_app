import 'package:drift/drift.dart';
import 'package:music_app/data/database/database.dart';
import 'package:music_app/data/database/db/app_db.dart';

part 'track_dao.g.dart';

@DriftAccessor(
  tables: [
    TrackEntity,
  ],
)
class TrackDao extends DatabaseAccessor<AppDatabase> {
  TrackDao(super.db);

  Stream<List<TrackEntityData>> watchTracks() async* {
    yield* select(db.trackEntity).watch();
  }

  Future<void> insertTrack(TrackEntityData data) {
    return into(db.trackEntity).insert(
      data,
      mode: InsertMode.insertOrReplace,
      onConflict: DoUpdate((old) => data),
    );
  }

  Future<void> deleteTable() async {
    delete(db.trackEntity);
  }

  Future<List<TrackEntityData>> getTracks() {
    return select(db.trackEntity).get();
  }
}

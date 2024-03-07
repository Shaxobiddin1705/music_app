import 'package:injectable/injectable.dart';
import 'package:music_app/data/database/database.dart';
import 'package:music_app/data/database/db/app_db.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class DatabaseModule {
  @singleton
  AppStorage provideAppStorage(
    SharedPreferences sharedPreferences,
  ) {
    return AppStorageImpl(sharedPreferences);
  }

  @singleton
  AppDatabase provideAppDatabase() => AppDatabase();

  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @lazySingleton
  TrackDao provideMyIdDao(AppDatabase db) => TrackDao(db);
}

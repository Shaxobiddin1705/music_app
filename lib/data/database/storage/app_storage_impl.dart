import 'package:music_app/data/database/storage/app_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStorageImpl implements AppStorage {
  final SharedPreferences _preferences;

  AppStorageImpl(this._preferences);

  static const _trackId = 'TRACK_ID';
  static const _condition = 'CONDITION';

  @override
  Future<int?> getTrackId() async {
    return _preferences.getInt(_trackId);
  }

  @override
  Future<void> saveTrackId(int id) {
    return _preferences.setInt(_trackId, id);
  }

  @override
  Future<bool?> getCondition() async {
    return _preferences.getBool(_condition);
  }

  @override
  Future<void> saveCondition(bool isOnline) {
    return _preferences.setBool(_condition, isOnline);
  }
}

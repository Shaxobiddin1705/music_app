abstract class AppStorage {
  Future<void> saveTrackId(int id);

  Future<int?> getTrackId();

  Future<void> saveCondition(bool isOnline);

  Future<bool?> getCondition();
}

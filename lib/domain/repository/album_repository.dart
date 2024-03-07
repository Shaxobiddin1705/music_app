import 'package:music_app/data/core/result.dart';
import 'package:music_app/domain/model/main_album.dart';
import 'package:music_app/domain/model/search_album.dart';
import 'package:music_app/domain/repository/src/base_repository.dart';
import 'package:on_audio_query/on_audio_query.dart';

abstract class AlbumRepository extends BaseRepository {
  Future<Result<MainAlbum>> fetchAlbum(int id);

  Future<Result<List<SearchAlbum>>> search(String text);

  Future<List<Track>> getTracks(String artist);

  Future<List<SongModel>> getSongs();

  Stream<List<Track>> watchTracks(String artist);
}

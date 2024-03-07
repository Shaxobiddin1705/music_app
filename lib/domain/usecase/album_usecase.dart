import 'package:music_app/data/core/result.dart';
import 'package:music_app/domain/model/main_album.dart';
import 'package:music_app/domain/model/search_album.dart';
import 'package:on_audio_query/on_audio_query.dart';

abstract class FetchAlbumUseCase {
  Future<Result<MainAlbum>> fetch(int id);
}

abstract class SearchAlbumUseCase {
  Future<Result<List<SearchAlbum>>> search(String text);
}

abstract class LocalTracksUseCase {
  Future<List<Track>> getTracks(String artist);

  Stream<List<Track>> watchTracks(String artist);
}

abstract class GetSongsUseCase {
  Future<List<SongModel>> getSongs();
}

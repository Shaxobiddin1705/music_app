import 'package:music_app/data/core/result.dart';
import 'package:music_app/domain/model/main_album.dart';
import 'package:music_app/domain/model/search_album.dart';
import 'package:music_app/domain/repository/album_repository.dart';
import 'package:music_app/domain/usecase/album_usecase.dart';
import 'package:on_audio_query_platform_interface/src/models/song_model.dart';

class FetchAlbumUseCaseImpl extends FetchAlbumUseCase {
  final AlbumRepository _albumRepository;

  FetchAlbumUseCaseImpl(this._albumRepository);

  @override
  Future<Result<MainAlbum>> fetch(int id) {
    return _albumRepository.fetchAlbum(id);
  }
}

class SearchAlbumUseCaseImpl extends SearchAlbumUseCase {
  final AlbumRepository _albumRepository;

  SearchAlbumUseCaseImpl(this._albumRepository);

  @override
  Future<Result<List<SearchAlbum>>> search(String text) {
    return _albumRepository.search(text);
  }
}

class LocalTracksUseCaseImpl extends LocalTracksUseCase {
  final AlbumRepository _albumRepository;

  LocalTracksUseCaseImpl(this._albumRepository);

  @override
  Future<List<Track>> getTracks(String artist) {
    return _albumRepository.getTracks(artist);
  }

  @override
  Stream<List<Track>> watchTracks(String artist) {
    return _albumRepository.watchTracks(artist);
  }
}

class GetSongsUseCaseImpl extends GetSongsUseCase {
  final AlbumRepository _albumRepository;

  GetSongsUseCaseImpl(this._albumRepository);

  @override
  Future<List<SongModel>> getSongs() {
    return _albumRepository.getSongs();
  }
}

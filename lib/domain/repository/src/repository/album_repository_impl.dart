import 'package:music_app/data/core/result.dart';
import 'package:music_app/data/database/db/dao/track_dao.dart';
import 'package:music_app/data/network/network.dart';
import 'package:music_app/domain/model/main_album.dart';
import 'package:music_app/domain/model/search_album.dart';
import 'package:music_app/domain/repository/album_repository.dart';
import 'package:music_app/domain/repository/src/mapping/main_album.dart';
import 'package:music_app/domain/repository/src/mapping/search_album.dart';
import 'package:on_audio_query/on_audio_query.dart';

class AlbumRepositoryImpl extends AlbumRepository {
  final AlbumProvider _albumProvider;
  final TrackDao _trackDao;
  final OnAudioQuery _audioQuery;

  AlbumRepositoryImpl(this._albumProvider, this._trackDao, this._audioQuery);

  @override
  Future<Result<List<SearchAlbum>>> search(String text) {
    return toResult2(
      _albumProvider.search(text),
      fromSuccessResponse: (response) {
        return response.data!.map((e) => e.toSearching()).toList();
      },
    );
  }

  @override
  Future<Result<MainAlbum>> fetchAlbum(int id) {
    return toResult2(
      _albumProvider.fetchAlbum(id),
      fromSuccessResponse: (response) => response.data!.toAlbum(),
    );
  }

  @override
  Future<List<Track>> getTracks(String artist) async {
    final tracks = await _trackDao.getTracks();
    return tracks.map((e) => e.toTrack(artist)).toList();
  }

  @override
  Stream<List<Track>> watchTracks(String artist) {
    return _trackDao
        .watchTracks()
        .asyncMap((event) => event.map((e) => e.toTrack(artist)).toList());
  }

  @override
  Future<List<SongModel>> getSongs() async {
    var songs = await _audioQuery.querySongs();

    // remove songs less than 10 seconds long (10,000 milliseconds)
    songs.removeWhere((song) => (song.duration ?? 0) < 10000);

    return songs;
  }
}

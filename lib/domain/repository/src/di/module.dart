import 'package:injectable/injectable.dart';
import 'package:music_app/data/database/database.dart';
import 'package:music_app/data/network/network.dart';
import 'package:music_app/domain/repository/repository.dart';
import 'package:music_app/domain/repository/src/repository/album_repository_impl.dart';
import 'package:music_app/domain/repository/src/repository/core_repository_impl.dart';
import 'package:on_audio_query/on_audio_query.dart';

@module
abstract class RepositoryModule {
  @lazySingleton
  AlbumRepository provideAlbumRepository(
    AlbumProvider playlistProvider,
    TrackDao trackDao,
    OnAudioQuery audioQuery,
  ) {
    return AlbumRepositoryImpl(playlistProvider, trackDao, audioQuery);
  }

  @lazySingleton
  CoreRepository provideCoreRepository(
    CoreProvider coreProvider,
    TrackDao trackDao,
  ) {
    return CoreRepositoryImpl(coreProvider, trackDao);
  }
}

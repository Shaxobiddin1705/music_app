import 'package:injectable/injectable.dart';
import 'package:music_app/app/app_bloc/app_bloc.dart';
import 'package:music_app/data/core/services/audio_manager.dart';
import 'package:music_app/domain/usecase/usecase.dart';
import 'package:on_audio_query/on_audio_query.dart';

@module
abstract class AppBlocModule {
  AlbumBloc provideAlbumBloc(
    FetchAlbumUseCase albumUseCase,
    DownloadFileUseCase downloadFileUseCase,
  ) {
    return AlbumBloc(albumUseCase, downloadFileUseCase);
  }

  SearchAlbumCubit provideSearchAlbumCubit(
    SearchAlbumUseCase searchAlbumUseCase,
    OnAudioQuery audioQuery,
  ) {
    return SearchAlbumCubit(searchAlbumUseCase, audioQuery);
  }

  @singleton
  PlaylistBloc providePlaylistBloc(PageManager pageManager) {
    return PlaylistBloc(pageManager);
  }

  LocalTracksBloc provideLocalTracksBloc(
    GetSongsUseCase songsUseCase,
  ) {
    return LocalTracksBloc(songsUseCase);
  }
}

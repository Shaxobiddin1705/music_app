import 'package:injectable/injectable.dart';
import 'package:music_app/domain/repository/repository.dart';
import 'package:music_app/domain/usecase/src/usecase/album_usecase_impl.dart';
import 'package:music_app/domain/usecase/src/usecase/core_usecase_impl.dart';
import 'package:music_app/domain/usecase/usecase.dart';

@module
abstract class UseCaseModule {
  @lazySingleton
  FetchAlbumUseCase provideFetchAlbumUseCase(
    AlbumRepository albumRepository,
  ) {
    return FetchAlbumUseCaseImpl(albumRepository);
  }

  @lazySingleton
  SearchAlbumUseCase provideSearchAlbumUseCase(
    AlbumRepository albumRepository,
  ) {
    return SearchAlbumUseCaseImpl(albumRepository);
  }

  @lazySingleton
  DownloadFileUseCase provideDownloadFileUseCase(
    CoreRepository coreRepository,
  ) {
    return DownloadFileUseCaseImpl(coreRepository);
  }

  @lazySingleton
  LocalTracksUseCase provideLocalTracksUseCase(
    AlbumRepository albumRepository,
  ) {
    return LocalTracksUseCaseImpl(albumRepository);
  }

  @lazySingleton
  GetSongsUseCase provideGetSongsUseCase(
    AlbumRepository albumRepository,
  ) {
    return GetSongsUseCaseImpl(albumRepository);
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:audio_service/audio_service.dart' as _i14;
import 'package:dio/dio.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:just_audio/just_audio.dart' as _i5;
import 'package:music_app/app/app_bloc/app_bloc.dart' as _i17;
import 'package:music_app/app/app_bloc/src/di/module.dart' as _i25;
import 'package:music_app/app/navigation/app_router.dart' as _i4;
import 'package:music_app/app/navigation/src/app_navigators/main_navigation.dart'
    as _i8;
import 'package:music_app/app/navigation/src/app_routes/main_router.dart'
    as _i9;
import 'package:music_app/app/navigation/src/di/module.dart' as _i22;
import 'package:music_app/app/navigation/src/guard/auth_guard.dart' as _i6;
import 'package:music_app/data/core/di/module.dart' as _i23;
import 'package:music_app/data/core/services/audio_handler.dart' as _i10;
import 'package:music_app/data/core/services/audio_manager.dart' as _i15;
import 'package:music_app/data/database/database.dart' as _i13;
import 'package:music_app/data/database/db/app_db.dart' as _i3;
import 'package:music_app/data/database/di/module.dart' as _i21;
import 'package:music_app/data/database/storage/app_storage.dart' as _i16;
import 'package:music_app/data/network/network.dart' as _i18;
import 'package:music_app/data/network/src/di/module.dart' as _i24;
import 'package:music_app/data/network/src/di/provider_module.dart' as _i26;
import 'package:music_app/domain/repository/repository.dart' as _i19;
import 'package:music_app/domain/repository/src/di/module.dart' as _i27;
import 'package:music_app/domain/usecase/src/di/module.dart' as _i28;
import 'package:music_app/domain/usecase/usecase.dart' as _i20;
import 'package:on_audio_query/on_audio_query.dart' as _i11;
import 'package:shared_preferences/shared_preferences.dart' as _i12;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final databaseModule = _$DatabaseModule();
    final navigatorModule = _$NavigatorModule();
    final coreModule = _$CoreModule();
    final networkModule = _$NetworkModule();
    final appBlocModule = _$AppBlocModule();
    final providerModule = _$ProviderModule();
    final repositoryModule = _$RepositoryModule();
    final useCaseModule = _$UseCaseModule();
    gh.singleton<_i3.AppDatabase>(databaseModule.provideAppDatabase());
    gh.singleton<_i4.AppRouter>(navigatorModule.provideAppRouter());
    gh.lazySingleton<_i5.AudioPlayer>(() => coreModule.provideAudioPlayer());
    gh.singleton<_i6.AuthGuard>(navigatorModule.provideAuthGuard());
    gh.factory<_i7.BaseOptions>(() => networkModule.baseOptions());
    gh.lazySingleton<_i8.MainNavigator>(
        () => navigatorModule.provideMainNavigator(gh<_i4.AppRouter>()));
    gh.lazySingleton<_i9.MainRoutes>(() => navigatorModule.provideMainRoutes());
    gh.factory<_i10.MyAudioHandler>(
        () => _i10.MyAudioHandler(gh<_i5.AudioPlayer>()));
    gh.lazySingleton<_i11.OnAudioQuery>(() => coreModule.provideOnAudioQuery());
    await gh.factoryAsync<_i12.SharedPreferences>(
      () => databaseModule.prefs,
      preResolve: true,
    );
    gh.singleton<String>(
      networkModule.provideBaseUrl(),
      instanceName: 'base_url',
    );
    gh.lazySingleton<_i13.TrackDao>(
        () => databaseModule.provideMyIdDao(gh<_i3.AppDatabase>()));
    gh.singleton<_i13.AppStorage>(
        databaseModule.provideAppStorage(gh<_i12.SharedPreferences>()));
    gh.singletonAsync<_i14.AudioHandler>(
        () => coreModule.provideAudioHandler(gh<_i5.AudioPlayer>()));
    gh.lazySingleton<_i7.Dio>(() => networkModule.provideDio(
          gh<_i7.BaseOptions>(),
          gh<String>(instanceName: 'base_url'),
        ));
    gh.singletonAsync<_i15.PageManager>(
        () async => coreModule.providePageManager(
              gh<_i5.AudioPlayer>(),
              await getAsync<_i14.AudioHandler>(),
              gh<_i16.AppStorage>(),
            ));
    gh.singletonAsync<_i17.PlaylistBloc>(() async =>
        appBlocModule.providePlaylistBloc(await getAsync<_i15.PageManager>()));
    gh.factory<_i18.AlbumProvider>(
        () => providerModule.provideAlbumProvider(gh<_i18.Dio>()));
    gh.lazySingleton<_i19.AlbumRepository>(
        () => repositoryModule.provideAlbumRepository(
              gh<_i18.AlbumProvider>(),
              gh<_i13.TrackDao>(),
              gh<_i11.OnAudioQuery>(),
            ));
    gh.factory<_i18.CoreProvider>(
        () => providerModule.provideCoreProvider(gh<_i18.Dio>()));
    gh.lazySingleton<_i19.CoreRepository>(
        () => repositoryModule.provideCoreRepository(
              gh<_i18.CoreProvider>(),
              gh<_i13.TrackDao>(),
            ));
    gh.lazySingleton<_i20.DownloadFileUseCase>(() =>
        useCaseModule.provideDownloadFileUseCase(gh<_i19.CoreRepository>()));
    gh.lazySingleton<_i20.FetchAlbumUseCase>(() =>
        useCaseModule.provideFetchAlbumUseCase(gh<_i19.AlbumRepository>()));
    gh.lazySingleton<_i20.GetSongsUseCase>(
        () => useCaseModule.provideGetSongsUseCase(gh<_i19.AlbumRepository>()));
    gh.factory<_i17.LocalTracksBloc>(
        () => appBlocModule.provideLocalTracksBloc(gh<_i20.GetSongsUseCase>()));
    gh.lazySingleton<_i20.LocalTracksUseCase>(() =>
        useCaseModule.provideLocalTracksUseCase(gh<_i19.AlbumRepository>()));
    gh.lazySingleton<_i20.SearchAlbumUseCase>(() =>
        useCaseModule.provideSearchAlbumUseCase(gh<_i19.AlbumRepository>()));
    gh.factory<_i17.AlbumBloc>(() => appBlocModule.provideAlbumBloc(
          gh<_i20.FetchAlbumUseCase>(),
          gh<_i20.DownloadFileUseCase>(),
        ));
    gh.factory<_i17.SearchAlbumCubit>(
        () => appBlocModule.provideSearchAlbumCubit(
              gh<_i20.SearchAlbumUseCase>(),
              gh<_i11.OnAudioQuery>(),
            ));
    return this;
  }
}

class _$DatabaseModule extends _i21.DatabaseModule {}

class _$NavigatorModule extends _i22.NavigatorModule {}

class _$CoreModule extends _i23.CoreModule {}

class _$NetworkModule extends _i24.NetworkModule {}

class _$AppBlocModule extends _i25.AppBlocModule {}

class _$ProviderModule extends _i26.ProviderModule {}

class _$RepositoryModule extends _i27.RepositoryModule {}

class _$UseCaseModule extends _i28.UseCaseModule {}

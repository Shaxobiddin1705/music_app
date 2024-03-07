// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/cupertino.dart' as _i8;
import 'package:music_app/app/design_system/design_system.dart' as _i10;
import 'package:music_app/app/feature/album_playlist/album_playlist_page.dart'
    as _i1;
import 'package:music_app/app/feature/home/home_page.dart' as _i2;
import 'package:music_app/app/feature/home/home_page_wrapper.dart' as _i3;
import 'package:music_app/app/feature/local_tracks/local_tracks_page.dart'
    as _i4;
import 'package:music_app/app/feature/music_detail/music_detail_page.dart'
    as _i5;
import 'package:music_app/app/feature/playlist/playlist_page.dart' as _i6;
import 'package:music_app/domain/model/main_album.dart' as _i11;
import 'package:music_app/domain/model/search_album.dart' as _i9;
import 'package:on_audio_query/on_audio_query.dart' as _i12;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    AlbumPlaylistRoute.name: (routeData) {
      final args = routeData.argsAs<AlbumPlaylistRouteArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.WrappedRoute(
            child: _i1.AlbumPlaylistPage(
          key: args.key,
          searchAlbum: args.searchAlbum,
        )),
      );
    },
    HomeRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomePage(),
      );
    },
    HomeRouter.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.WrappedRoute(child: const _i3.HomePageWrapper()),
      );
    },
    LocalTracksRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.LocalTracksPage(),
      );
    },
    MusicDetailRoute.name: (routeData) {
      final args = routeData.argsAs<MusicDetailRouteArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.MusicDetailPage(
          key: args.key,
          track: args.track,
          tracks: args.tracks,
          song: args.song,
          songs: args.songs,
        ),
      );
    },
    PlaylistRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.PlaylistPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AlbumPlaylistPage]
class AlbumPlaylistRoute extends _i7.PageRouteInfo<AlbumPlaylistRouteArgs> {
  AlbumPlaylistRoute({
    _i8.Key? key,
    required _i9.SearchAlbum searchAlbum,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          AlbumPlaylistRoute.name,
          args: AlbumPlaylistRouteArgs(
            key: key,
            searchAlbum: searchAlbum,
          ),
          initialChildren: children,
        );

  static const String name = 'AlbumPlaylistRoute';

  static const _i7.PageInfo<AlbumPlaylistRouteArgs> page =
      _i7.PageInfo<AlbumPlaylistRouteArgs>(name);
}

class AlbumPlaylistRouteArgs {
  const AlbumPlaylistRouteArgs({
    this.key,
    required this.searchAlbum,
  });

  final _i8.Key? key;

  final _i9.SearchAlbum searchAlbum;

  @override
  String toString() {
    return 'AlbumPlaylistRouteArgs{key: $key, searchAlbum: $searchAlbum}';
  }
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute({List<_i7.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomePageWrapper]
class HomeRouter extends _i7.PageRouteInfo<void> {
  const HomeRouter({List<_i7.PageRouteInfo>? children})
      : super(
          HomeRouter.name,
          initialChildren: children,
        );

  static const String name = 'HomeRouter';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i4.LocalTracksPage]
class LocalTracksRoute extends _i7.PageRouteInfo<void> {
  const LocalTracksRoute({List<_i7.PageRouteInfo>? children})
      : super(
          LocalTracksRoute.name,
          initialChildren: children,
        );

  static const String name = 'LocalTracksRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i5.MusicDetailPage]
class MusicDetailRoute extends _i7.PageRouteInfo<MusicDetailRouteArgs> {
  MusicDetailRoute({
    _i10.Key? key,
    required _i11.Track? track,
    required List<_i11.Track> tracks,
    _i12.SongModel? song,
    required List<_i12.SongModel> songs,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          MusicDetailRoute.name,
          args: MusicDetailRouteArgs(
            key: key,
            track: track,
            tracks: tracks,
            song: song,
            songs: songs,
          ),
          initialChildren: children,
        );

  static const String name = 'MusicDetailRoute';

  static const _i7.PageInfo<MusicDetailRouteArgs> page =
      _i7.PageInfo<MusicDetailRouteArgs>(name);
}

class MusicDetailRouteArgs {
  const MusicDetailRouteArgs({
    this.key,
    required this.track,
    required this.tracks,
    this.song,
    required this.songs,
  });

  final _i10.Key? key;

  final _i11.Track? track;

  final List<_i11.Track> tracks;

  final _i12.SongModel? song;

  final List<_i12.SongModel> songs;

  @override
  String toString() {
    return 'MusicDetailRouteArgs{key: $key, track: $track, tracks: $tracks, song: $song, songs: $songs}';
  }
}

/// generated route for
/// [_i6.PlaylistPage]
class PlaylistRoute extends _i7.PageRouteInfo<void> {
  const PlaylistRoute({List<_i7.PageRouteInfo>? children})
      : super(
          PlaylistRoute.name,
          initialChildren: children,
        );

  static const String name = 'PlaylistRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

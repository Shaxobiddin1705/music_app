import 'package:music_app/app/design_system/design_system.dart';
import 'package:music_app/app/navigation/app_router.dart';
import 'package:music_app/app/navigation/app_router.gr.dart';
import 'package:music_app/app/navigation/src/app_navigators/main_navigation.dart';
import 'package:music_app/domain/model/main_album.dart';
import 'package:music_app/domain/model/search_album.dart';
import 'package:on_audio_query/on_audio_query.dart';

class MainNavigatorImpl implements MainNavigator {
  final AppRouter appRouter;

  const MainNavigatorImpl(this.appRouter);

  @override
  Future<void> navigateAlbumPlaylist(
    BuildContext context,
    SearchAlbum searchAlbum,
  ) {
    return appRouter.navigate(AlbumPlaylistRoute(searchAlbum: searchAlbum));
  }

  @override
  Future<void> navigateMusicDetail(
    BuildContext context,
    List<Track> tracks,
    Track? track,
    SongModel? song,
    List<SongModel> songs,
  ) {
    return appRouter.navigate(
      MusicDetailRoute(track: track, tracks: tracks, songs: songs, song: song),
    );
  }

  @override
  Future<void> navigatePlaylist(BuildContext context) {
    return appRouter.navigate(const PlaylistRoute());
  }

  @override
  Future<void> navigateLocalTracks(BuildContext context) {
    return appRouter.navigate(const LocalTracksRoute());
  }
}

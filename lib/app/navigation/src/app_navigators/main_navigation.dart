import 'package:flutter/cupertino.dart';
import 'package:music_app/domain/model/main_album.dart';
import 'package:music_app/domain/model/search_album.dart';
import 'package:on_audio_query/on_audio_query.dart';

abstract class MainNavigator {
  Future<void> navigateAlbumPlaylist(
    BuildContext context,
    SearchAlbum searchAlbum,
  );

  Future<void> navigateMusicDetail(
    BuildContext context,
    List<Track> tracks,
    Track? track,
    SongModel? song,
    List<SongModel> songs,
  );

  Future<void> navigatePlaylist(BuildContext context);

  Future<void> navigateLocalTracks(BuildContext context);
}

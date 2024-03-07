import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/data/core/core.dart';
import 'package:music_app/domain/model/main_album.dart';

part 'playlist_event.dart';

part 'playlist_state.dart';

class PlaylistBloc extends Bloc<PlaylistEvent, PlaylistState> {
  PlaylistBloc(this._pageManager) : super(PlaylistInitial()) {
    on<ChangePlaylistEvent>(_changePlaylist);
  }

  final PageManager _pageManager;

  final PageManager pageManager = GetIt.I.get<PageManager>();

  Future<void> _changePlaylist(
    ChangePlaylistEvent event,
    Emitter<PlaylistState> emit,
  ) async {
    if (event.newIndex != event.oldIndex) {
      pageManager.reorderPlaylist(event.newIndex, event.oldIndex);
    }
    emit(PlaylistReordered(tracks: event.tracks));
  }
}

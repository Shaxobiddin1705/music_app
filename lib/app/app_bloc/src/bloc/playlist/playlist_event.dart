part of 'playlist_bloc.dart';

abstract class PlaylistEvent extends Equatable {
  const PlaylistEvent();
}

class ChangePlaylistEvent extends PlaylistEvent {
  final List<Track> tracks;
  final int newIndex;
  final int oldIndex;

  const ChangePlaylistEvent({
    required this.tracks,
    this.newIndex = 0,
    this.oldIndex = 0,
  });

  @override
  List<Object?> get props => [tracks, newIndex, oldIndex];
}

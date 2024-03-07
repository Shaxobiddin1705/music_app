part of 'playlist_bloc.dart';

abstract class PlaylistState extends Equatable {
  const PlaylistState();
}

class PlaylistInitial extends PlaylistState {
  @override
  List<Object> get props => [];
}

class PlaylistReordered extends PlaylistState {
  final List<Track> tracks;

  const PlaylistReordered({required this.tracks});

  PlaylistReordered copyWith({
    List<Track>? tracks,
  }) =>
      PlaylistReordered(tracks: tracks ?? this.tracks);

  @override
  List<Object> get props => [tracks];
}

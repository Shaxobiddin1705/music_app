part of 'album_bloc.dart';

abstract class AlbumEvent extends Equatable {
  const AlbumEvent();
}

class FetchAlbumEvent extends AlbumEvent {
  final int id;

  const FetchAlbumEvent({required this.id});

  @override
  List<Object?> get props => [id];
}

class DownloadFileEvent extends AlbumEvent {
  final Track track;

  const DownloadFileEvent(this.track);

  @override
  List<Object?> get props => [track];
}

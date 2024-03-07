part of 'album_bloc.dart';

abstract class AlbumState extends Equatable {
  const AlbumState();
}

class AlbumInitial extends AlbumState {
  @override
  List<Object> get props => [];
}

class AlbumLoading extends AlbumState {
  const AlbumLoading();

  @override
  List<Object> get props => [];
}

class AlbumLoaded extends AlbumState {
  final MainAlbum mainAlbum;
  final bool isDownloading;

  const AlbumLoaded({required this.mainAlbum, required this.isDownloading});

  AlbumLoaded copyWith({
    MainAlbum? mainAlbum,
    bool? isDownloading,
  }) =>
      AlbumLoaded(
        mainAlbum: mainAlbum ?? this.mainAlbum,
        isDownloading: isDownloading ?? this.isDownloading,
      );

  @override
  List<Object> get props => [mainAlbum, isDownloading];
}

class AlbumError extends AlbumState {
  final String error;

  const AlbumError(this.error);

  @override
  List<Object> get props => [error];
}

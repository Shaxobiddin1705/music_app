part of 'search_album_cubit.dart';

@freezed
class SearchAlbumState with _$SearchAlbumState {
  const factory SearchAlbumState.initial() = _Initial;
  const factory SearchAlbumState.loading() = _Loading;
  const factory SearchAlbumState.loaded(List<SearchAlbum> albums) = _Loaded;
  const factory SearchAlbumState.error(String error) = _Error;
}

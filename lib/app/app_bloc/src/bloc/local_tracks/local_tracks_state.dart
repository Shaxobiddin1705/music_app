part of 'local_tracks_bloc.dart';

@freezed
class LocalTracksState with _$LocalTracksState {
  const factory LocalTracksState.initial() = _Initial;
  const factory LocalTracksState.loading() = _Loading;
  const factory LocalTracksState.loaded(List<SongModel> songs) = _Loaded;
  const factory LocalTracksState.error(String error) = _Error;
}

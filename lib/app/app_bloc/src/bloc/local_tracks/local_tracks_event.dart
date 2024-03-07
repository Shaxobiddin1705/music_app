part of 'local_tracks_bloc.dart';

@freezed
class LocalTracksEvent with _$LocalTracksEvent {
  const factory LocalTracksEvent.started() = _Started;
  const factory LocalTracksEvent.getTracks() = _GetTracks;
}

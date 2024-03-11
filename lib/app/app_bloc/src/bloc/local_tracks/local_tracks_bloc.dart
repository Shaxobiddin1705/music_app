import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:music_app/domain/usecase/album_usecase.dart';
import 'package:on_audio_query/on_audio_query.dart';

part 'local_tracks_event.dart';

part 'local_tracks_state.dart';

part 'local_tracks_bloc.freezed.dart';

class LocalTracksBloc extends Bloc<LocalTracksEvent, LocalTracksState> {
  LocalTracksBloc(this._songsUseCase)
      : super(const LocalTracksState.initial()) {
    on<_GetTracks>(_getTracks);
  }

  final GetSongsUseCase _songsUseCase;

  Future<void> _getTracks(
    _GetTracks event,
    Emitter<LocalTracksState> emit,
  ) async {
    emit(const _Loading());
    final res = await _songsUseCase.getSongs();
    emit(_Loaded(res));
  }
}

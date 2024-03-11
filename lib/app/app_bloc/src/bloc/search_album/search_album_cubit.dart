import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:music_app/data/core/result.dart';
import 'package:music_app/domain/model/search_album.dart';
import 'package:music_app/domain/usecase/album_usecase.dart';
import 'package:on_audio_query/on_audio_query.dart';

part 'search_album_state.dart';

part 'search_album_cubit.freezed.dart';

class SearchAlbumCubit extends Cubit<SearchAlbumState> {
  SearchAlbumCubit(this._searchAlbumUseCase, this._audioQuery)
      : super(const SearchAlbumState.initial());
  final SearchAlbumUseCase _searchAlbumUseCase;
  final OnAudioQuery _audioQuery;
  bool _permission = false;

  Future<void> search() async {
    emit(const _Loading());
    _permission = await _checkAndRequestPermissions();
    if (_permission) {
      final res = await _searchAlbumUseCase.search('eminem');
      switch (res.status) {
        case Status.completed:
          emit(_Loaded(res.data!));
        case Status.error:
          emit(_Error(res.message ?? ''));
      }
    } else {
      emit(const _Error('Permission denied'));
    }
  }

  Future<bool> _checkAndRequestPermissions({bool retry = false}) async {
    _permission = await _audioQuery.checkAndRequest(
      retryRequest: retry,
    );
    if (!_permission) {
      _checkAndRequestPermissions(retry: true);
    }
    return _permission;
  }
}

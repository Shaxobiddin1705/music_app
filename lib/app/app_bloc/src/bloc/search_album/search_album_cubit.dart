import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:music_app/data/core/result.dart';
import 'package:music_app/domain/model/search_album.dart';
import 'package:music_app/domain/usecase/album_usecase.dart';

part 'search_album_state.dart';
part 'search_album_cubit.freezed.dart';

class SearchAlbumCubit extends Cubit<SearchAlbumState> {
  SearchAlbumCubit(this._searchAlbumUseCase)
      : super(const SearchAlbumState.initial());
  final SearchAlbumUseCase _searchAlbumUseCase;

  Future<void> search() async {
    emit(const _Loading());
    final res = await _searchAlbumUseCase.search('eminem');
    switch (res.status) {
      case Status.completed:
        emit(_Loaded(res.data!));
      case Status.error:
        emit(_Error(res.message ?? ''));
    }
  }
}

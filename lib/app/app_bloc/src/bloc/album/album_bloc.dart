import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/data/core/result.dart';
import 'package:music_app/domain/model/main_album.dart';
import 'package:music_app/domain/usecase/album_usecase.dart';
import 'package:music_app/domain/usecase/core_usecase.dart';

part 'album_event.dart';

part 'album_state.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  AlbumBloc(
    this._albumUseCase,
    this._downloadFileUseCase,
  ) : super(AlbumInitial()) {
    on<FetchAlbumEvent>(_fetch);
    on<DownloadFileEvent>(_downloadFile);
  }

  final FetchAlbumUseCase _albumUseCase;
  final DownloadFileUseCase _downloadFileUseCase;

  Future<void> _fetch(FetchAlbumEvent event, Emitter<AlbumState> emit) async {
    emit(const AlbumLoading());
    final res = await _albumUseCase.fetch(event.id);
    switch (res.status) {
      case Status.completed:
        emit(AlbumLoaded(mainAlbum: res.data!, isDownloading: false));
      case Status.error:
        emit(AlbumError(res.message ?? ''));
    }
  }

  Future<void> _downloadFile(
    DownloadFileEvent event,
    Emitter<AlbumState> emit,
  ) async {
    emit((state as AlbumLoaded).copyWith(isDownloading: true));
    final res = await _downloadFileUseCase.downloadFile(event.track);
    switch (res.status) {
      case Status.completed:
        emit((state as AlbumLoaded).copyWith(isDownloading: false));
      case Status.error:
        emit((state as AlbumLoaded).copyWith(isDownloading: false));
    }
  }
}

import 'dart:io';

import 'package:music_app/data/core/result.dart';
import 'package:music_app/domain/model/main_album.dart';
import 'package:music_app/domain/repository/core_repository.dart';
import 'package:music_app/domain/usecase/core_usecase.dart';

class DownloadFileUseCaseImpl extends DownloadFileUseCase {
  final CoreRepository _coreRepository;

  DownloadFileUseCaseImpl(this._coreRepository);

  @override
  Future<Result<File?>> downloadFile(Track track) {
    return _coreRepository.downloadFile(track);
  }
}

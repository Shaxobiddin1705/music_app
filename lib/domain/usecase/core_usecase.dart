import 'dart:io';

import 'package:music_app/data/core/result.dart';
import 'package:music_app/domain/model/main_album.dart';

abstract class DownloadFileUseCase {
  Future<Result<File?>> downloadFile(Track track);
}

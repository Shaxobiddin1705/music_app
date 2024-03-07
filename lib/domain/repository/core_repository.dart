import 'dart:io';

import 'package:music_app/data/core/result.dart';
import 'package:music_app/domain/model/main_album.dart';
import 'package:music_app/domain/repository/src/base_repository.dart';

abstract class CoreRepository extends BaseRepository {
  Future<Result<File?>> downloadFile(Track track);
}

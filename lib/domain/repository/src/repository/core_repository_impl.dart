import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:music_app/data/core/result.dart';
import 'package:music_app/data/database/db/app_db.dart';
import 'package:music_app/data/database/db/dao/track_dao.dart';
import 'package:music_app/data/network/src/provider/core_provider.dart';
import 'package:music_app/domain/model/main_album.dart';
import 'package:music_app/domain/repository/core_repository.dart';
import 'package:path_provider/path_provider.dart';

class CoreRepositoryImpl extends CoreRepository {
  final CoreProvider _coreProvider;
  final TrackDao _trackDao;

  CoreRepositoryImpl(this._coreProvider, this._trackDao);

  @override
  Future<Result<File?>> downloadFile(Track track) async {
    final now = DateTime.now().toString();
    final musicFile = await _getFilePath(now);
    final music = await toResult2(
      _coreProvider.downloadFile(track.preview!, musicFile?.path ?? ''),
      fromSuccessResponse: (response) {
        return response.success ? musicFile : null;
      },
    );
    final imageFile = await _getFilePath(now);
    await toResult2(
      _coreProvider.downloadFile(track.networkImage!, imageFile?.path ?? ''),
      fromSuccessResponse: (response) {
        return response.success ? imageFile : null;
      },
    );
    await _saveToLocal(musicFile, imageFile, track);
    return music;
  }

  Future<void> _saveToLocal(File? music, File? image, Track track) async {
    Uint8List? bytes = music?.readAsBytesSync();
    Uint8List? imageBytes = image?.readAsBytesSync();
    if (bytes != null) {
      await _trackDao.insertTrack(
        TrackEntityData(
          id: track.id,
          title: track.title,
          albumTitle: track.albumTitle,
          music: bytes,
          image: imageBytes!,
          artist: '',
        ),
      );
    }
  }

  Future<File?> _getFilePath(String filename) async {
    Directory? dir;
    if (Platform.isIOS) {
      dir = await getApplicationDocumentsDirectory();
    } else {
      dir = await getExternalStorageDirectory();
    }
    if (dir == null) return null;
    final File file = File('${dir.path}/$filename.mp3');
    await file.create(recursive: true);
    await file.writeAsBytes(file.readAsBytesSync());
    print(file.path);
    return file;
  }
}

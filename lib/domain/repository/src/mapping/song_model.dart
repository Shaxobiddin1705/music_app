import 'package:audio_service/audio_service.dart';
import 'package:on_audio_query/on_audio_query.dart';

extension SongModelExt on SongModel {
  MediaItem toMediaItem() {
    return MediaItem(
      id: '$id',
      album: album,
      title: title,
      artist: artist,
      duration: Duration(milliseconds: duration!),
      extras: {
        'song': uri,
      },
    );
  }
}

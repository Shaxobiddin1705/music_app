import 'package:audio_service/audio_service.dart';
import 'package:injectable/injectable.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app/data/core/services/audio_handler.dart';
import 'package:music_app/data/core/services/audio_manager.dart';
import 'package:music_app/data/database/storage/app_storage.dart';
import 'package:on_audio_query/on_audio_query.dart';

@module
abstract class CoreModule {
  /// need alice to show all api logs
  @singleton
  Future<AudioHandler> provideAudioHandler(AudioPlayer audioPlayer) async {
    return await AudioService.init(
      builder: () => MyAudioHandler(audioPlayer),
      config: const AudioServiceConfig(
        androidNotificationChannelId: 'com.mycompany.myapp.audio',
        androidNotificationChannelName: 'Audio Service Demo',
        androidNotificationOngoing: true,
        androidStopForegroundOnPause: true,
      ),
    );
  }

  @lazySingleton
  AudioPlayer provideAudioPlayer() => AudioPlayer();

  @singleton
  PageManager providePageManager(
    AudioPlayer audioPlayer,
    AudioHandler audioHandler,
    AppStorage appStorage,
  ) {
    return PageManager(audioPlayer, audioHandler, appStorage);
  }

  @lazySingleton
  OnAudioQuery provideOnAudioQuery() => OnAudioQuery();
}

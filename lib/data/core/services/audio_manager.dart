import 'package:audio_service/audio_service.dart';
import 'package:flutter/foundation.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app/data/core/core.dart';
import 'package:music_app/data/core/services/audio_handler.dart';
import 'package:music_app/data/database/storage/app_storage.dart';
import 'package:music_app/domain/model/main_album.dart';
import 'package:music_app/domain/repository/src/mapping/main_album.dart';
import 'package:music_app/domain/repository/src/mapping/song_model.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:rxdart/src/streams/value_stream.dart';

class PageManager {
  PageManager(
    this._player,
    this._audioHandler,
    this._appStorage,
  );

  final AudioPlayer _player;
  final AudioHandler _audioHandler;
  final AppStorage _appStorage;

  final currentSongTitleNotifier = ValueNotifier<String>('');
  final playlistNotifier = ValueNotifier<List<String>>([]);
  final progressNotifier = ProgressNotifier();
  final repeatButtonNotifier = RepeatButtonNotifier();
  final isFirstSongNotifier = ValueNotifier<bool>(true);
  final playButtonNotifier = PlayButtonNotifier();
  final isLastSongNotifier = ValueNotifier<bool>(true);
  final isShuffleModeEnabledNotifier = ValueNotifier<bool>(false);

  List<Track> _lastTracks = [];
  List<SongModel> _lastSongs = [];
  final _myAudioHandler = GetIt.I.get<MyAudioHandler>();

  Future<void> init(
    Track? track,
    List<Track> tracks,
    SongModel? song,
    List<SongModel> songs,
  ) async {
    final check = await _checkPlayer(track, tracks, song, songs);
    if (check) {
      if (!_player.playing) play();
      return;
    }
    await _setTracks(tracks, track, song, songs);
    _listenToPlaybackState();
    _listenToCurrentPosition();
    _listenToBufferedPosition();
    _listenToTotalDuration();
    _listenToChangesInSong();
  }

  Future<bool> _checkPlayer(
    Track? track,
    List<Track> tracks,
    SongModel? song,
    List<SongModel> songs,
  ) async {
    if (listEquals(_lastTracks, tracks) && track != null) {
      int index = tracks.indexOf(track);
      _player.seek(null, index: index);
      return true;
    }
    if (listEquals(_lastSongs, songs) && song != null) {
      int index = songs.indexOf(song);
      _player.seek(null, index: index);
      return true;
    }
    final id = await _appStorage.getTrackId();
    if (id == null) return false;
    if (track?.id == id) return true;
    if (song?.id == id) return true;
    if (song == null && track == null) return true;
    return false;
  }

  Future<void> _setTracks(
    List<Track> tracks,
    Track? track,
    SongModel? song,
    List<SongModel> songs,
  ) async {
    List<MediaItem> mediaItems = [];
    int index = 0;
    if (track != null) {
      mediaItems = tracks.map((e) => e.toMediaItem()).toList();
      index = tracks.indexOf(track);
      await _appStorage.saveTrackId(track.id);
      await _appStorage.saveCondition(true);
    } else if (song != null) {
      mediaItems = songs.map((e) => e.toMediaItem()).toList();
      index = songs.indexOf(song);
      await _appStorage.saveTrackId(song.id);
      await _appStorage.saveCondition(false);
    }
    _lastTracks = tracks;
    _lastSongs = songs;
    try {
      final audioSources = mediaItems.map(_createAudioSource).toList();
      await _player.setAudioSource(
        ConcatenatingAudioSource(children: audioSources),
        initialIndex: index,
      );

      _myAudioHandler.addQueueItems(mediaItems);
      play();
    } catch (e) {
      if (kDebugMode) {
        print("Error: $e");
      }
    }
  }

  AudioSource _createAudioSource(MediaItem mediaItem) {
    final url = (mediaItem.extras?['url'] as String?) ??
        (mediaItem.extras?['song'] as String?);
    return AudioSource.uri(
      Uri.parse(url ?? ''),
      tag: mediaItem,
    );
  }

  Stream<ButtonState> get playbackState =>
      _audioHandler.playbackState.asyncMap((event) {
        final isPlaying = event.playing;
        final processingState = event.processingState;
        if (processingState == AudioProcessingState.loading ||
            processingState == AudioProcessingState.buffering) {
          return ButtonState.loading;
        } else if (!isPlaying) {
          return ButtonState.paused;
        } else if (processingState != AudioProcessingState.completed) {
          return ButtonState.playing;
        } else {
          _myAudioHandler.seek(Duration.zero);
          _myAudioHandler.pause();
        }
        return ButtonState.paused;
      });

  void _listenToPlaybackState() {
    _myAudioHandler.playbackState.listen((playbackState) {
      final isPlaying = playbackState.playing;
      final processingState = playbackState.processingState;
      if (processingState == AudioProcessingState.loading ||
          processingState == AudioProcessingState.buffering) {
        playButtonNotifier.value = ButtonState.loading;
      } else if (!isPlaying) {
        playButtonNotifier.value = ButtonState.paused;
      } else if (processingState != AudioProcessingState.completed) {
        playButtonNotifier.value = ButtonState.playing;
      } else {
        _myAudioHandler.seek(Duration.zero);
        _myAudioHandler.pause();
      }
    });
  }

  void _listenToCurrentPosition() {
    AudioService.position.listen((position) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: position,
        buffered: oldState.buffered,
        total: oldState.total,
      );
    });
  }

  void _listenToBufferedPosition() {
    _myAudioHandler.playbackState.listen((playbackState) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: oldState.current,
        buffered: playbackState.bufferedPosition,
        total: oldState.total,
      );
    });
  }

  void _listenToTotalDuration() {
    _myAudioHandler.mediaItem.listen((mediaItem) {
      final oldState = progressNotifier.value;
      print('total duration -> ${mediaItem?.duration}');
      progressNotifier.value = ProgressBarState(
        current: oldState.current,
        buffered: oldState.buffered,
        total: mediaItem?.duration ?? Duration.zero,
      );
    });
  }

  void _listenToChangesInSong() {
    _myAudioHandler.mediaItem.listen((mediaItem) {
      currentSongTitleNotifier.value = mediaItem?.title ?? '';
      _updateSkipButtons();
    });
  }

  void _updateSkipButtons() {
    final mediaItem = _myAudioHandler.mediaItem.value;
    final playlist = _myAudioHandler.queue.value;
    if (playlist.length < 2 || mediaItem == null) {
      isFirstSongNotifier.value = true;
      isLastSongNotifier.value = true;
    } else {
      isFirstSongNotifier.value = playlist.first == mediaItem;
      isLastSongNotifier.value = playlist.last == mediaItem;
    }
  }

  void updateQueue(List<Track> tracks) {
    final queue = tracks.map((e) => e.toMediaItem()).toList();
    _myAudioHandler.addQueueItems(queue);
    // _player.audioSource
  }

  void play() => _myAudioHandler.play();

  void pause() => _myAudioHandler.pause();

  void seek(Duration position) => _myAudioHandler.seek(position);

  void previous() => _myAudioHandler.skipToPrevious();

  void next() => _myAudioHandler.skipToNext();

  Stream<bool> playingStream() => _player.playingStream;

  void repeat() {
    repeatButtonNotifier.nextState();
    final repeatMode = repeatButtonNotifier.value;
    switch (repeatMode) {
      case RepeatState.off:
        _myAudioHandler.setRepeatMode(AudioServiceRepeatMode.none);
        break;
      case RepeatState.repeatSong:
        _myAudioHandler.setRepeatMode(AudioServiceRepeatMode.one);
        break;
      case RepeatState.repeatPlaylist:
        _myAudioHandler.setRepeatMode(AudioServiceRepeatMode.all);
        break;
    }
  }

  void shuffle() {
    final enable = !isShuffleModeEnabledNotifier.value;
    isShuffleModeEnabledNotifier.value = enable;
    if (enable) {
      _myAudioHandler.setShuffleMode(AudioServiceShuffleMode.all);
    } else {
      _myAudioHandler.setShuffleMode(AudioServiceShuffleMode.none);
    }
  }

  ValueStream<MediaItem?> get mediaItem => _myAudioHandler.mediaItem;

  Stream<int?> get currentIndex => _player.currentIndexStream;

  void reorderPlaylist(int newIndex, int oldIndex) {
    _myAudioHandler.reorderPlaylist(newIndex, oldIndex);
  }

  void dispose() {
    _myAudioHandler.customAction('dispose');
  }

  void stop() {
    _myAudioHandler.stop();
  }
}

import 'dart:math';

import 'package:collection/collection.dart';
import 'package:dart_vlc/dart_vlc.dart';
import 'package:get/get.dart';
import 'package:symphony_desktop/data/models/song_model.dart';
import 'package:symphony_desktop/data/repositories/player_service_repository.dart';

class PlayerService extends GetxService {
  final PlayerServiceRepository repository;

  late final Player _player;

  final Rx<List<SongModel>?> _queue = Rx(null);
  final Rx<SongModel?> _currentSong = Rx(null);
  final Rx<Duration> _duration = Rx(Duration.zero);
  final Rx<Duration> _position = Rx(Duration.zero);
  final Rx<Duration> _buffer = Rx(Duration.zero);
  final Rx<double> _volume = Rx(1.0);
  final Rx<bool> _isRepeat = Rx(false);
  final Rx<bool> _isShuffle = Rx(false);
  final Rx<bool> _isPlaying = Rx(false);

  //getters
  SongModel? get getCurrentSong => _currentSong.value;
  Duration get getDuration => _duration.value;
  Duration get getPosition => _position.value;
  Duration get getBuffer => _buffer.value;
  double get getVolume => _volume.value;
  bool get getIsRepeat => _isRepeat.value;
  bool get getIsShuffle => _isShuffle.value;
  bool get getIsPlaying => _isPlaying.value;

  @override
  void onInit() {
    super.onInit();
    _player = Player(id: Random().nextInt(60000));

    _player.playbackStream.listen((PlaybackState state) {
      _isPlaying.value = state.isPlaying;
    });
    _player.positionStream.listen((PositionState state) {
      _duration.value = state.duration ?? Duration.zero;
      _position.value = state.position ?? Duration.zero;
    });
    _player.bufferingProgressStream.listen((double state) {
      _buffer.value = Duration(milliseconds: state.round());
    });
    _player.currentStream.listen((CurrentState state) {
      if (state.index != null && _queue.value != null) {
        _currentSong.value = _queue.value![state.index!];
      }
    });
    _player.generalStream.listen((GeneralState state) {
      _volume.value = state.volume;
    });
  }

  @override
  void onClose() {
    super.onClose();
    _player.dispose();
  }

  PlayerService({required this.repository});

  void play({
    required List<SongModel>? songs,
    required int index,
  }) async {
    if (const IterableEquality().equals(_queue.value, songs) == false) {
      _queue.value = songs?.toList();

      final List<Uri?> urls = await Future.wait(
        [for (SongModel song in songs ?? []) repository.getStreamUrl(song)],
      );

      final Playlist playlist = Playlist(
        medias: [for (Uri? url in urls) Media.network(url)],
      );

      _player.open(playlist, autoStart: false);
    }

    _player.play();
    _player.jumpToIndex(index);
  }

  void playOrPause() {
    _player.playOrPause();
  }

  void next() {
    _player.next();
  }

  void previous() {
    _player.previous();
  }

  void seek(Duration duration) {
    _player.seek(duration);
  }

  void repeat() {
    if (_isRepeat.value == true) {
      _player.setPlaylistMode(PlaylistMode.loop);
    } else {
      _player.setPlaylistMode(PlaylistMode.repeat);
    }

    _isRepeat.value = !_isRepeat.value;
  }

  void shuffle() {
    _isShuffle.value = !_isShuffle.value;
  }

  void setVolume(double volume) {
    _player.setVolume(volume);
  }
}

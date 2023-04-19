import 'dart:math';

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
  final Rx<bool> _isPlaying = Rx(false);

  //getters
  SongModel? get getCurrentSong => _currentSong.value;
  Duration get getDuration => _duration.value;
  Duration get getPosition => _position.value;
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
    _player.currentStream.listen((CurrentState state) {
      if (state.index != null && _queue.value != null) {
        _currentSong.value = _queue.value![state.index!];
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
    _player.dispose();
  }

  PlayerService({required this.repository});

  void play({
    required List<SongModel> songs,
    required int index,
  }) async {
    if (_queue.value != songs) {
      _queue.value = songs.toList();

      final List<Uri?> urls = await Future.wait(
        [for (SongModel song in songs) repository.getStreamUrl(song)],
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

  void repeat(Duration duration) {}

  void shuffle(Duration duration) {}
}

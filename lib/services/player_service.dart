import 'package:get/get.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:symphony_desktop/data/models/playlist_model.dart';
import 'package:symphony_desktop/data/models/song_model.dart';
import 'package:just_audio/just_audio.dart';

class PlayerService extends GetxService {
  static final _player = AudioPlayer(userAgent: "chrome");

  final Rx<SongModel?> _currentSong = Rx(null);
  final Rx<bool> _isPlaying = Rx(false);
  final Rx<Duration> _position = Rx(const Duration(milliseconds: 0));
  final Rx<Duration> _bufferedPosition = Rx(const Duration(milliseconds: 0));
  final Rx<double> _volume = Rx(1);
  final Rx<bool> _isShuffle = Rx(false);
  final Rx<bool> _isLoop = Rx(false);

  //getters
  SongModel? get getCurrentSong => _currentSong.value;
  bool get getIsPlaying => _isPlaying.value;
  Duration get getPosition => _position.value;
  Duration get getBufferedPosition => _bufferedPosition.value;
  double get getVolume => _volume.value;
  bool get getIsShuffle => _isShuffle.value;
  bool get getIsLoop => _isLoop.value;

  //setters
  set setVolume(double value) => _volume.value = value;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    _player.dispose();
  }

  Future<void> play(
      {required PlaylistModel playlist, required int index}) async {
    final queue = ConcatenatingAudioSource(
      children: playlist.songs
          .map(
            (e) => AudioSource.uri(
              e.url,
              tag: MediaItem(
                id: e.id,
                title: e.title,
                artist: e.author,
                duration: e.duration,
                artUri: e.thumbnail,
              ),
            ),
          )
          .toList(),
    );

    await _player.setAudioSource(queue, initialIndex: index);
    await _player.play();
  }

  Future<void> shuffle() async => await _player.shuffle();

  Future<void> next() async => await _player.seekToNext();

  Future<void> previous() async => await _player.seekToPrevious();

  Future<void> seek(Duration position) async => await _player.seek(position);

  Future<void> loop() async {
    if (_isLoop.value == true) {
      await _player.setLoopMode(LoopMode.all);
    } else {
      await _player.setLoopMode(LoopMode.off);
    }
  }

  Future<void> muteOrUnmute() async {
    if (_volume.value == 0) {
      await _player.setVolume(1);
    } else {
      await _player.setVolume(0);
    }
  }

  Future<void> playOrPause() async {
    if (_isPlaying.value == true) {
      await _player.pause();
    } else {
      await _player.play();
    }
  }
}

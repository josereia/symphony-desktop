import 'package:get/get.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:symphony_desktop/data/models/playlist_model.dart';
import 'package:symphony_desktop/data/models/song_model.dart';
import 'package:just_audio/just_audio.dart';

class PlayerService extends GetxService {
  static final _player = AudioPlayer(userAgent: "chrome");

  final Rx<PlaylistModel?> _playlist = Rx(null);
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

  @override
  void onReady() {
    super.onReady();

    _player.currentIndexStream.listen((index) {
      _currentSong.value = _playlist.value?.songs[index ?? 0];
    });

    _player.playerStateStream.listen((event) {
      _isPlaying.value = event.playing;
    });

    _player.positionStream.listen((position) {
      _position.value = position;
      _position.refresh();
    });

    _player.bufferedPositionStream.listen(
      (position) => _bufferedPosition.value = position,
    );
  }

  @override
  void onClose() {
    super.onClose();
    _player.dispose();
  }

  Future<void> play({
    required PlaylistModel playlist,
    required int index,
  }) async {
    _playlist.value = playlist;
    /*final queue = ConcatenatingAudioSource(
      children: playlist.songs
          .map(
            (e) => AudioSource.uri(
              Uri.parse(
                  "http://cld3097web.audiovideoweb.com/va90web25003/companions/Foundations%20of%20Rock/13.01.mp3"),
              /* tag: MediaItem(
                id: e.id,
                title: e.title,
                artist: e.author,
                duration: e.duration,
                artUri: e.thumbnail,
              ),*/
            ),
          )
          .toList(),
    );*/

    await _player
        .setAudioSource(
          AudioSource.uri(playlist.songs[index].url),
          initialIndex: index,
        )
        .then((value) => _player.play());
  }

  Future<void> shuffle() async => await _player.shuffle();

  Future<void> next() async => await _player.seekToNext();

  Future<void> previous() async => await _player.seekToPrevious();

  Future<void> seek(Duration position) async => await _player.seek(position);

  Future<void> setVolume(double value) async {
    _volume.value = value;
    _player.setVolume(value);
  }

  Future<void> loop() async {
    if (_isLoop.value == true) {
      await _player.setLoopMode(LoopMode.all);
    } else {
      await _player.setLoopMode(LoopMode.off);
    }
  }

  Future<void> muteOrUnmute() async {
    if (_volume.value == 0) {
      _volume.value = 1;
      _player.setVolume(1);
    } else {
      _volume.value = 0;
      _player.setVolume(0);
    }
  }

  Future<void> playOrPause() async {
    print("DSddd");
    if (_isPlaying.value == true) {
      await _player.pause();
    } else {
      await _player.play();
    }
  }
}

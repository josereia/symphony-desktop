import 'package:dart_vlc/dart_vlc.dart';
import 'package:get/get.dart';
import 'package:symphony_desktop/data/models/song_model.dart';

class PlayerController extends GetxController {
  final _audioPlayer = Player(id: 69420, commandlineArguments: ['--no-video']);
  final Rx<Duration> _duration = const Duration(milliseconds: 0).obs;
  final Rx<Duration> _position = const Duration(milliseconds: 0).obs;
  final Rx<Duration> _bufferedPosition = const Duration(milliseconds: 0).obs;
  final RxBool _isPlaying = false.obs;
  final RxBool _isShuffle = false.obs;
  final RxBool _isLoop = false.obs;
  final Rx<SongModel> _currentSong = SongModel(
    title: "",
    artists: [""],
    album: "",
    albumArt:
        "http://static1.squarespace.com/static/5d2e2c5ef24531000113c2a4/5d392a924397f100011fa30e/5d447e71b57a0b0001e64e19/1579825897991/?format=1500w",
    songUrl: "",
    duration: 0,
  ).obs;
  final RxList<SongModel> _songs = [
    SongModel(
      title: "title",
      artists: ["artists"],
      album: "album",
      albumArt: "albumArt",
      songUrl: "songUrl",
      duration: 0,
    ),
  ].obs;

  Duration get getDuration => _duration.value;
  Duration get getPosition => _position.value;
  Duration get getBufferedPosition => _bufferedPosition.value;
  bool get getIsPlaying => _isPlaying.value;
  bool get getIsShuffle => _isShuffle.value;
  bool get getIsLoop => _isLoop.value;
  SongModel get getCurrentSong => _currentSong.value;
  List<SongModel> get getSongs => _songs;

  @override
  void onInit() {
    _audioPlayer.currentStream.listen((CurrentState state) {
      _currentSong.value = _songs[state.index ?? 0];
    });
    _audioPlayer.playbackStream.listen((PlaybackState state) {
      _isPlaying.value = state.isPlaying;
    });
    _audioPlayer.positionStream.listen((PositionState state) {
      _position.value = Duration(milliseconds: state.position!.inMilliseconds);
      _duration.value = Duration(milliseconds: state.duration!.inMilliseconds);
    });
    _audioPlayer.bufferingProgressStream.listen((double bufferedPosition) {
      _bufferedPosition.value = bufferedPosition.milliseconds;
    });

    super.onInit();
  }

  void play(List<SongModel> songs, int index, String playlistTitle) {
    _songs.value = songs;
    _audioPlayer.open(
      Playlist(
        medias: songs
            .map(
              (song) => Media.network(song.songUrl),
            )
            .toList(),
      ),
      autoStart: false,
    );
    _audioPlayer.play();
    _audioPlayer.jumpToIndex(index);
  }

  void playOrPause() {
    _audioPlayer.playOrPause();
  }

  void next() {
    _audioPlayer.next();
  }

  void previous() {
    _audioPlayer.previous();
  }

  void seek(Duration position) {
    _audioPlayer.seek(position);
  }
}

import 'dart:async';
import 'dart:developer';
import 'package:dart_vlc/dart_vlc.dart';
import 'package:get/get.dart';
import 'package:symphony_desktop/data/models/song_model.dart';

class PlayerController extends GetxController {
  final _audioPlayer =
      Player(id: 69420, commandlineArguments: ['--no-video'], bool: true);
  final Rx<Duration> _duration = const Duration(milliseconds: 0).obs;
  final Rx<Duration> _position = const Duration(milliseconds: 0).obs;
  final Rx<Duration> _bufferedPosition = const Duration(milliseconds: 0).obs;
  final RxBool _isPlaying = false.obs;
  final RxBool _isShuffle = false.obs;
  final RxBool _isLoop = false.obs;
  final RxBool _isMuted = false.obs;
  final RxDouble _volume = 1.0.obs;
  final RxInt _currentIndex = 0.obs;
  final RxBool _isCompleted = false.obs;
  final Rx<SongModel> _currentSong = SongModel(
    title: "",
    artists: [""],
    album: "",
    albumArt: "",
    songUrl: "",
    duration: 0,
  ).obs;
  final RxList<SongModel> _originalSongs = [
    SongModel(
      title: "",
      artists: [""],
      album: "",
      albumArt: "",
      songUrl: "",
      duration: 0,
    ),
  ].obs;

  final RxList<SongModel> _songs = [
    SongModel(
      title: "",
      artists: [""],
      album: "",
      albumArt: "",
      songUrl: "",
      duration: 0,
    ),
  ].obs;

  //getters
  Duration get getDuration => _duration.value;
  Duration get getPosition => _position.value;
  Duration get getBufferedPosition => _bufferedPosition.value;
  bool get getIsPlaying => _isPlaying.value;
  bool get getIsShuffle => _isShuffle.value;
  bool get getIsLoop => _isLoop.value;
  bool get getIsMuted => _isMuted.value;
  double get getVolume => _volume.value;
  SongModel get getCurrentSong => _currentSong.value;

  @override
  void onInit() {
    _audioPlayer.currentStream.listen((CurrentState state) {
      _currentIndex.value = state.index ?? 0;
      _currentSong.value = _isShuffle.value
          ? _songs[_currentIndex.value]
          : _originalSongs[_currentIndex.value];
    });
    _audioPlayer.playbackStream.listen((PlaybackState state) {
      _isPlaying.value = state.isPlaying;
      _isCompleted.value = state.isCompleted;
    });
    _audioPlayer.positionStream.listen((PositionState state) {
      _position.value = Duration(milliseconds: state.position!.inMilliseconds);
      _duration.value = Duration(milliseconds: state.duration!.inMilliseconds);
    });
    _audioPlayer.bufferingProgressStream.listen((double bufferedPosition) {
      _bufferedPosition.value = bufferedPosition.milliseconds;
    });
    _audioPlayer.generalStream.listen((GeneralState state) {
      _volume.value = state.volume;
    });

    super.onInit();
  }

  @override
  void onClose() {
    _audioPlayer.dispose();
    super.onClose();
  }

  void _openPlaylist({
    required List<SongModel> songs,
    bool? autoStart,
  }) {
    _audioPlayer.open(
      autoStart: autoStart ?? false,
      Playlist(
        playlistMode: _isLoop.value ? PlaylistMode.repeat : PlaylistMode.loop,
        medias: songs
            .map(
              (song) => Media.network(song.songUrl),
            )
            .toList(),
      ),
    );
  }

  void play(List<SongModel> songs, int index, String playlistTitle) {
    _originalSongs.value = songs.toList();
    _songs.value = songs.toList();
    _songs.shuffle();

    if (_isShuffle.value) {
      _openPlaylist(songs: _songs);
      _audioPlayer.play();
      _audioPlayer.jumpToIndex(
        _songs.indexWhere((SongModel element) =>
            element.songUrl == _originalSongs[index].songUrl),
      );
    } else {
      _openPlaylist(songs: _originalSongs, autoStart: false);
      _audioPlayer.play();
      _audioPlayer.jumpToIndex(index);
    }
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

  void setSeek(Duration position) {
    _audioPlayer.seek(position);
  }

  void setRepeat() {
    _isLoop.value = !_isLoop.value;
    if (_isLoop.value) {
      _audioPlayer.setPlaylistMode(PlaylistMode.repeat);
    } else {
      _audioPlayer.setPlaylistMode(PlaylistMode.loop);
    }
  }

  void setShuffle() {
    _isShuffle.value = !_isShuffle.value;

    _isCompleted.listenAndPump(
      (event) {
        if (event) {
          if (_isShuffle.value) {
            _songs.shuffle();
            _openPlaylist(songs: _songs, autoStart: true);
          } 
        }
      },
    );
  }

  void muteOrUnmute() {
    if (_volume.value != 0) {
      _audioPlayer.setVolume(0);
    } else {
      _audioPlayer.setVolume(1);
    }
  }

  void setVolume(double volume) {
    _audioPlayer.setVolume(volume);
  }
}

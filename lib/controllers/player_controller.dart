import 'dart:math';
import 'package:dart_vlc/dart_vlc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:symphony_desktop/controllers/arduino_controller.dart';
import 'package:symphony_desktop/data/models/song_model.dart';
import 'package:palette_generator/palette_generator.dart';

Future<Color> _getAlbumColor(String src) async {
  return await PaletteGenerator.fromImageProvider(
    NetworkImage(src),
    size: const Size(200, 200),
  ).then((value) => value.dominantColor!.color);
}

class PlayerController extends GetxController {
  final ArduinoController _arduinoController = ArduinoController();
  final _audioPlayer = Player(id: 69420, commandlineArguments: ['--no-video']);
  final Rx<Duration> _duration = const Duration(milliseconds: 0).obs;
  final Rx<Duration> _position = const Duration(milliseconds: 0).obs;
  final Rx<Duration> _bufferedPosition = const Duration(milliseconds: 0).obs;
  final RxBool _isPlaying = false.obs;
  final RxBool _isShuffle = false.obs;
  final RxBool _isLoop = false.obs;
  final RxBool _isMuted = false.obs;
  final RxDouble _volume = 1.0.obs;
  final Rx<Color> _color = Colors.white.obs;
  final Rx<SongModel> _currentSong = SongModel(
    title: "",
    artists: [""],
    album: "",
    albumArt: "",
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
  bool get getIsMuted => _isMuted.value;
  double get getVolume => _volume.value;
  SongModel get getCurrentSong => _currentSong.value;
  Color get getColor => _color.value;

  @override
  void onInit() {
    super.onInit();

    _audioPlayer.currentStream.listen((CurrentState state) {
      _currentSong.value = _songs[state.index!];
      _getAlbumColor(_currentSong.value.albumArt).then((value) {
        _arduinoController.sendColor(value);
        _color.value = value;
      });
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
    _audioPlayer.generalStream.listen((GeneralState state) {
      _volume.value = state.volume;
    });
  }

  @override
  void onClose() {
    super.onClose();
    _audioPlayer.dispose();
  }

  void play(List<SongModel> songs, int index, String playlistTitle) {
    _songs.value = songs.toList();
    _audioPlayer.open(
      autoStart: false,
      Playlist(
        playlistMode: PlaylistMode.loop,
        medias: songs
            .map(
              (song) => Media.network(song.songUrl),
            )
            .toList(),
      ),
    );
    _audioPlayer.play();
    _audioPlayer.jumpToIndex(index);

    _getAlbumColor(_songs[index].albumArt).then((value) {
      _arduinoController.sendColor(value);
      _color.value = value;
    });
  }

  void playOrPause() {
    _audioPlayer.playOrPause();
  }

  void setRepeat() {
    if (_isLoop.value) {
      _audioPlayer.setPlaylistMode(PlaylistMode.loop);
    } else {
      _audioPlayer.setPlaylistMode(PlaylistMode.repeat);
    }
    _isLoop.value = !_isLoop.value;
  }

  void setShuffle() {
    _isShuffle.value = !_isShuffle.value;
  }

  void muteOrUnmute() {
    if (_volume.value != 0) {
      _audioPlayer.setVolume(0);
    } else {
      _audioPlayer.setVolume(1);
    }
  }

  void next() {
    if (_isShuffle.value) {
      final int random = Random().nextInt(_songs.length);
      _audioPlayer.jumpToIndex(random);
    } else {
      _audioPlayer.next();
    }
  }

  void previous() {
    _audioPlayer.previous();
  }

  void seek(Duration position) {
    _audioPlayer.seek(position);
  }

  void setVolume(double volume) {
    _audioPlayer.setVolume(volume);
  }
}

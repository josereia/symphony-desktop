import 'package:firedart/firedart.dart';

class SongModel {
  final String title;
  final List artists;
  final String album;
  final String albumArt;
  final String songUrl;
  final int duration;

  SongModel({
    required this.title,
    required this.artists,
    required this.album,
    required this.albumArt,
    required this.songUrl,
    required this.duration,
  });

  factory SongModel.fromPageDocument(
    Document document,
    String albumArt,
    String songUrl,
  ) {
    return SongModel(
      title: document["title"],
      artists: document["artists"],
      album: document["album"],
      albumArt: albumArt,
      songUrl: songUrl,
      duration: document["duration"],
    );
  }
}

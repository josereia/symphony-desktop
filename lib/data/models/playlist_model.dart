import 'package:symphony_desktop/data/models/song_model.dart';

class PlaylistModel {
  final String id;
  final String title;
  final String description;
  final String author;
  final Uri url;
  final int videoCount;
  final List<SongModel> songs;

  PlaylistModel({
    required this.id,
    required this.title,
    required this.description,
    required this.author,
    required this.url,
    required this.videoCount,
    required this.songs,
  });
}

class SongModel {
  final String id;
  final String title;
  final String author;
  final Uri url;
  final Uri thumbnail;
  final Duration duration;
  final String mimeType;
  final int length;

  SongModel({
    required this.id,
    required this.title,
    required this.author,
    required this.url,
    required this.thumbnail,
    required this.duration,
    required this.mimeType,
    required this.length,
  });
}

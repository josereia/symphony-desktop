class AlbumModel {
  final String title;
  final String artist;
  final String albumArt;
  final int year;
  final int trackCount;
  final int explicit;
  final int genre;

  AlbumModel({
    required this.title,
    required this.artist,
    required this.albumArt,
    required this.year,
    required this.trackCount,
    required this.explicit,
    required this.genre,
  });
}

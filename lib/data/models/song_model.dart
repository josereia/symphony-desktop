import 'dart:convert';

class SongModel {
  final int index;
  final String id;
  final String title;
  final String? album;
  final String artist;
  final Duration? duration;
  final Uri thumbnail;
  final Uri? streamUrl;

  const SongModel({
    required this.index,
    required this.id,
    required this.title,
    this.album,
    required this.artist,
    this.duration,
    required this.thumbnail,
    this.streamUrl,
  });

  SongModel copyWith({
    int? index,
    String? id,
    String? title,
    String? album,
    String? artist,
    Duration? duration,
    Uri? thumbnail,
    Uri? streamUrl,
  }) {
    return SongModel(
      index: index ?? this.index,
      id: id ?? this.id,
      title: title ?? this.title,
      album: album ?? this.album,
      artist: artist ?? this.artist,
      duration: duration ?? this.duration,
      thumbnail: thumbnail ?? this.thumbnail,
      streamUrl: streamUrl ?? this.streamUrl,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'index': index});
    result.addAll({'id': id});
    result.addAll({'title': title});
    if (album != null) {
      result.addAll({'album': album});
    }
    result.addAll({'artist': artist});
    if (duration != null) {
      result.addAll({'duration': duration!.toString()});
    }
    result.addAll({'thumbnail': thumbnail.toString()});
    if (streamUrl != null) {
      result.addAll({'streamUrl': streamUrl!.toString()});
    }

    return result;
  }

  factory SongModel.fromMap(Map<String, dynamic> map) {
    return SongModel(
      index: map['index']?.toInt() ?? 0,
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      album: map['album'],
      artist: map['artist'] ?? '',
      duration:
          map['duration'] != null ? Duration(seconds: map['duration']) : null,
      thumbnail: Uri.parse(map['thumbnail']),
      streamUrl: map['streamUrl'] != null ? Uri.parse(map['streamUrl']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SongModel.fromJson(String source) =>
      SongModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SongModel(index: $index, id: $id, title: $title, album: $album, artist: $artist, duration: $duration, thumbnail: $thumbnail, streamUrl: $streamUrl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SongModel &&
        other.index == index &&
        other.id == id &&
        other.title == title &&
        other.album == album &&
        other.artist == artist &&
        other.duration == duration &&
        other.thumbnail == thumbnail &&
        other.streamUrl == streamUrl;
  }

  @override
  int get hashCode {
    return index.hashCode ^
        id.hashCode ^
        title.hashCode ^
        album.hashCode ^
        artist.hashCode ^
        duration.hashCode ^
        thumbnail.hashCode ^
        streamUrl.hashCode;
  }
}

import 'package:symphony_desktop/data/models/playlist_model.dart';
import 'package:symphony_desktop/data/models/song_model.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class SongProvider {
  static final YoutubeExplode _youtubeExplode = YoutubeExplode();

  Future<PlaylistModel> getPlaylist({required String playlistId}) async {
    final Playlist playlist = await _youtubeExplode.playlists.get(playlistId);
    final List<Video> videos = await _youtubeExplode.playlists
        .getVideos(
          playlist.id,
        )
        .take(10)
        .toList();

    final List<SongModel> songs = [];

    for (Video video in videos) {
      final manifest = await _youtubeExplode.videos.streamsClient.getManifest(
        video.id.value,
      );
      final stream = manifest.audioOnly.withHighestBitrate();

      songs.add(
        SongModel(
          id: video.id.value,
          title: video.title,
          author: video.author,
          url: stream.url,
          thumbnail: Uri.parse(video.thumbnails.highResUrl),
          duration: video.duration ?? const Duration(milliseconds: 0),
          mimeType: stream.codec.mimeType,
          length: stream.size.totalBytes,
        ),
      );
    }

    return PlaylistModel(
      id: playlist.id.value,
      title: playlist.title,
      description: playlist.description,
      author: playlist.author,
      url: Uri.parse(playlist.url),
      videoCount: playlist.videoCount ?? 0,
      songs: songs,
    );
  }
}

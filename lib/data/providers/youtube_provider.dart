import 'package:symphony_desktop/data/models/song_model.dart';
import 'package:symphony_desktop/data/providers/song_provider.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class YoutubeProvider implements SongProvider {
  @override
  Future<Uri?> getStreamUrl(SongModel song) async {
    Uri? response;
    final instance = YoutubeExplode();
    final StreamManifest manifest =
        await instance.videos.streamsClient.getManifest(song.id);
    final AudioOnlyStreamInfo info = manifest.audioOnly.withHighestBitrate();

    response = info.url;

    instance.close();
    return response;
  }

  @override
  Future<List<SongModel>?> search(String search) async {
    List<SongModel>? response;
    final instance = YoutubeExplode();
    final VideoSearchList results = await instance.search(search);

    if (results.isNotEmpty) {
      response = [];
      for (var i = 0; i < results.length; i++) {
        final result = results[i];

        response.add(
          SongModel(
            index: i,
            id: result.id.value,
            title: result.title,
            artist: result.author,
            thumbnail: Uri.parse(result.thumbnails.highResUrl),
          ),
        );
      }
    }

    instance.close();
    return response;
  }
}

import 'package:symphony_desktop/data/models/playlist_model.dart';
import 'package:symphony_desktop/data/providers/song_provider.dart';

class HomePageRepository {
  final SongProvider songProvider;

  HomePageRepository({required this.songProvider});

  Future<PlaylistModel> getPlaylist({required String playlistId}) async {
    return await songProvider.getPlaylist(playlistId: playlistId);
  }
}

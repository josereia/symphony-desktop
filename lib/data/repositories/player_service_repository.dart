import 'package:symphony_desktop/data/models/song_model.dart';
import 'package:symphony_desktop/data/providers/song_provider.dart';

class PlayerServiceRepository extends SongProvider {
  final SongProvider songProvider;

  PlayerServiceRepository({required this.songProvider});

  @override
  Future<Uri?> getStreamUrl(SongModel song) async {
    return await songProvider.getStreamUrl(song);
  }
}

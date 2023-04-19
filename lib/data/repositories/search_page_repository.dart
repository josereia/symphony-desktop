import 'package:symphony_desktop/data/models/song_model.dart';
import 'package:symphony_desktop/data/providers/song_provider.dart';

class SearchPageRepository implements SongProvider {
  final SongProvider songProvider;

  SearchPageRepository({required this.songProvider});

  @override
  Future<Uri?> getStreamUrl(SongModel song) async {
    return await songProvider.getStreamUrl(song);
  }

  @override
  Future<List<SongModel>?> search(String search) async {
    return await songProvider.search(search);
  }
}

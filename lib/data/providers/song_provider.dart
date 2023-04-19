import 'package:symphony_desktop/data/models/song_model.dart';

abstract class SongProvider {
  Future<List<SongModel>?> search(String search) async {
    return null;
  }

  Future<Uri?> getStreamUrl(SongModel song) async {
    return null;
  }
}

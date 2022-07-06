import 'package:firedart/firedart.dart';
import 'package:symphony_desktop/data/models/song_model.dart';
import 'package:symphony_desktop/data/providers/songdata_provider.dart';

class DatabaseProvider {
  final firestore = Firestore("symphony-61682");
  final SongDataProvider _songDataProvider = SongDataProvider();

  DatabaseProvider();

  Future<List<SongModel>> getSongs() async {
    return await firestore.collection("songs").get().then((value) {
      final List<SongModel> songs = [];
      for (var i = 0; i < value.length; i++) {
        final song = value[i];
        songs.add(
          SongModel.fromPageDocument(
            song,
            _songDataProvider.getAlbumArtURL(song["album"]),
            _songDataProvider.getSongURL(
              song["title"],
              song["artists"][0],
            ),
          ),
        );
      }

      return songs;
    });
  }
}

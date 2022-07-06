import 'package:get/get.dart';
import 'package:symphony_desktop/data/models/song_model.dart';
import 'package:symphony_desktop/data/repositories/database_repository.dart';

class DatabaseController extends GetxController {
  final DatabaseRepository _repository;
  final RxList<SongModel> _songs = [
    SongModel(
      title: "title",
      artists: ["artists"],
      album: "album",
      albumArt:
          "http://static1.squarespace.com/static/5d2e2c5ef24531000113c2a4/5d392a924397f100011fa30e/5d447e71b57a0b0001e64e19/1579825897991/?format=1500w",
      songUrl: "songUrl",
      duration: 0,
    ),
  ].obs;

  List<SongModel> get getSongsList => _songs.value;

  DatabaseController(this._repository);

  @override
  Future<void> onInit() async {
    _songs.value = await _repository.getSongs();
    super.onInit();
  }
}

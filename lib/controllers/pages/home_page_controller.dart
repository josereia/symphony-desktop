import 'package:get/get.dart';
import 'package:symphony_desktop/data/models/playlist_model.dart';
import 'package:symphony_desktop/data/models/song_model.dart';
import 'package:symphony_desktop/data/repositories/home_page_repository.dart';

class HomePageController extends GetxController {
  final HomePageRepository repository;

  final Rx<List<PlaylistModel>?> _playlists = Rx(null);

  //getters
  List<PlaylistModel>? get getPlaylists => _playlists.value;

  HomePageController({required this.repository});

  @override
  Future<void> onReady() async {
    super.onReady();

    await repository
        .getPlaylist(playlistId: "PLDIoUOhQQPlXr63I_vwF9GD8sAKh77dWU")
        .then(
      (value) {
        _playlists.value ??= [];
        _playlists.value?.add(value);
        _playlists.refresh();
      },
    );

    await repository.getPlaylist(playlistId: "PLE9BCD9CB9000E132").then(
      (value) {
        _playlists.value ??= [];
        _playlists.value?.add(value);
        _playlists.refresh();
      },
    );

    await repository
        .getPlaylist(playlistId: "PLMC9KNkIncKtPzgY-5rmhvj7fax8fdxoj")
        .then(
      (value) {
        _playlists.value ??= [];
        _playlists.value?.add(value);
        _playlists.refresh();
      },
    );

    await repository
        .getPlaylist(playlistId: "PLq8S6NLKB0ViDlA0yXNnFKn0U2MjH0edD")
        .then(
      (value) {
        _playlists.value ??= [];
        _playlists.value?.add(value);
        _playlists.refresh();
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:symphony_desktop/data/models/song_model.dart';
import 'package:symphony_desktop/data/repositories/search_page_repository.dart';

class SearchPageController extends GetxController {
  final SearchPageRepository repository;

  final Rx<bool> _isSearching = Rx(false);
  final Rx<List<SongModel>?> _results = Rx(null);

  //fields
  final TextEditingController _searchFieldController = TextEditingController();

  //getters
  bool get getIsSearching => _isSearching.value;
  List<SongModel>? get getResults => _results.value;
  TextEditingController get getSearchFieldController => _searchFieldController;

  SearchPageController({required this.repository});

  Future<List<SongModel>?> search() async {
    try {
      _isSearching.value = true;
      _results.value = await repository.search(_searchFieldController.text);
      _isSearching.value = false;
    } catch (e) {
      _isSearching.value = false;
      print(e);
    }

    return null;
  }
}

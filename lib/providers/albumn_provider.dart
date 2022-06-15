import 'package:everest_walk_groups/features/services/doi_post_albumn.dart';
import 'package:everest_walk_groups/models/album_model.dart';
import 'package:flutter/material.dart';

class AlbumProvider extends ChangeNotifier {
  List<AlbumModel>? album;
  bool loading = false;

  Future<List<AlbumModel>?> getAlbum(int id) async {
    loading = true;
    album = await DioCallAPI().viewAlbums(id);

    loading = false;

    notifyListeners();
    return album;
  }
}

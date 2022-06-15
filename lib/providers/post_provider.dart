import 'package:everest_walk_groups/features/services/doi_post_albumn.dart';
import 'package:everest_walk_groups/models/posts_model.dart';
import 'package:flutter/material.dart';

class PostProvider extends ChangeNotifier {
  List<PostsModel>? post;
  bool loading = false;

  Future<List<PostsModel>?> getPosts(int id) async {
    loading = true;
    post = await DioCallAPI().viewPosts(id);
    loading = false;

    notifyListeners();
    return post;
  }
}

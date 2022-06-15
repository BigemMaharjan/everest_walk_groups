import 'package:dio/dio.dart';
import 'package:everest_walk_groups/features/services/helper.dart';
import 'package:everest_walk_groups/models/album_model.dart';
import 'package:everest_walk_groups/models/posts_model.dart';

class DioCallAPI {
  //Getting Posts of user
  Future<List<PostsModel>?> viewPosts(int id) async {
    try {
      Dio dio = await getApi();
      Response<String> response = await dio.get("/posts?userId=$id");
      // print(response.data);
      return postsModelFromJson(response.data!);
    } catch (e) {
      print('Error viewing Posts: $e');
      return null;
    }
  }

  // Getting Albumns of user
  Future<List<AlbumModel>?> viewAlbums(int id) async {
    try {
      Dio dio = await getApi();
      Response<String> response = await dio.get("/albums?userId=$id");
      // print(response.data);
      return albumModelFromJson(response.data!);
    } catch (e) {
      print('Error viewing Albumns: $e');
      return null;
    }
  }
}

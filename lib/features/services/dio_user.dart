import 'package:dio/dio.dart';
import 'package:everest_walk_groups/features/services/helper.dart';
import 'package:everest_walk_groups/models/single_user_model.dart';
import 'package:everest_walk_groups/models/user_model.dart';

class DioCallAPI {
  //Getting all the users
  Future<List<UserModel>?> viewUser() async {
    try {
      Dio dio = await getApi();
      Response<String> response = await dio.get("/users");
      // print(response.data);
      return userModelFromJson(response.data!);
    } catch (e) {
      print('Error viewing User: $e');
      return null;
    }
  }

  //Getting Single User
  Future<SingleUserModel?> viewSingleUser(int id) async {
    try {
      // print(1);
      Dio dio = await getApi();
      Response<String> response = await dio.get("/users/$id");
      // print(response.data);
      return singleUserModelFromJson(response.data!);
    } catch (e) {
      print('Error viewing single User: $e');
      return null;
    }
  }
}

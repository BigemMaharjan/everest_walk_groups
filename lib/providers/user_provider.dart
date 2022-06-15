import 'package:everest_walk_groups/features/services/dio_user.dart';
import 'package:everest_walk_groups/models/user_model.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  List<UserModel>? user;
  bool loading = false;

  Future<List<UserModel>?> getUserData() async {
    loading = true;
    user = await DioCallAPI().viewUser();

    loading = false;
    notifyListeners();
    return user;
  }
}

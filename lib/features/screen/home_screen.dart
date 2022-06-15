import 'package:everest_walk_groups/features/screen/user_detail.dart';
import 'package:everest_walk_groups/features/services/arguments.dart';
import 'package:everest_walk_groups/features/utils/style.dart';
import 'package:everest_walk_groups/features/widgets/posts_albums.dart';
import 'package:everest_walk_groups/models/user_model.dart';
import 'package:everest_walk_groups/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<UserModel>?>? listOfUser;

  @override
  void initState() {
    super.initState();
    final userList = Provider.of<UserProvider>(context, listen: false);
    listOfUser = userList.getUserData();
  }

  //For Getting first letter of the word
  String takeLetters(String name) {
    var first = name.split(" ");
    if (first.length == 1) {
      return first[0].substring(0, 1);
    } else {
      return first[0].substring(0, 1) + first[first.length - 1].substring(0, 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "List of Users",
          style: stylePageTitle,
        ),
        elevation: 0.0,
        backgroundColor: Colors.indigoAccent.withOpacity(0.4),
        centerTitle: true, //to center the title in appBar//
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 85),
        child: _userList(context),
      ),
    );
  }

  Widget _userList(context) {
    final userList = Provider.of<UserProvider>(context);
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: FutureBuilder<List<UserModel>?>(
          future: listOfUser,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return ListView.separated(
                scrollDirection: Axis.vertical,
                itemCount: userList.user!.length,
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return Divider(
                    color: Colors.grey[400],
                    thickness: 1,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onLongPress: () {
                      // On long press displaying the user detail in new screen
                      Navigator.pushNamed(
                        context,
                        UserDetail.routeName,
                        arguments: UserID(userList.user![index].id),
                      );
                    },
                    child: SizedBox(
                      height: 65,
                      width: 344,
                      child: Row(
                        children: [
                          const SizedBox(width: 23),
                          SizedBox(
                            height: 45,
                            width: 45,
                            // Showing first letter from the name or full name in circle avatar
                            child: CircleAvatar(
                              backgroundColor:
                                  Colors.indigoAccent.withOpacity(0.4),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Text(
                                  takeLetters(
                                      userList.user![index].name.toUpperCase()),
                                  style: styleComposeText,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 13),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Displaying name of user
                              Text(
                                userList.user![index].name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                              // Displaying email of user
                              Text(
                                userList.user![index].email,
                                style: const TextStyle(color: Colors.red),
                              ),
                              // Displaying phone of user
                              Text(userList.user![index].phone),
                            ],
                          ),
                          Expanded(child: Container()),
                          InkWell(
                            onTap: () {
                              // on tap it will redirect to the new screen where post and album of a selected user is displayed
                              Navigator.pushNamed(
                                context,
                                PostAlbum.routeName,
                                arguments: UserID(userList.user![index].id),
                              );
                            },
                            child: const Icon(
                              Icons.arrow_right_alt_rounded,
                              size: 50,
                              color: Colors.indigoAccent,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          }),
    );
  }
}

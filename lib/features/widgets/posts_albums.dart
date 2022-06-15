import 'package:everest_walk_groups/features/screen/albumn_screen.dart';
import 'package:everest_walk_groups/features/screen/post_screen.dart';
import 'package:everest_walk_groups/features/services/arguments.dart';
import 'package:everest_walk_groups/features/utils/style.dart';
import 'package:flutter/material.dart';

class PostAlbum extends StatefulWidget {
  static const String routeName = '/post-albumn';
  const PostAlbum({Key? key}) : super(key: key);

  @override
  State<PostAlbum> createState() => _PostAlbumState();
}

class _PostAlbumState extends State<PostAlbum> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as UserID;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Posts and Albumns",
            style: stylePageTitle,
          ),
          elevation: 0.0,
          backgroundColor: Colors.indigoAccent.withOpacity(0.4),
          centerTitle: true, //to center the title in appBar//

          bottom: TabBar(
            indicatorColor: Colors.indigoAccent,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.black.withOpacity(0.5),
            tabs: const [
              Tab(
                  icon: Icon(
                    Icons.post_add,
                    size: 35,
                    color: Colors.red,
                  ),
                  text: 'Posts'),
              Tab(
                icon: Icon(
                  Icons.album,
                  size: 35,
                  color: Colors.red,
                ),
                text: 'Albumns',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            PostScreen(id: args.id),
            AlbumnScreen(id: args.id),
          ],
        ),
      ),
    );
  }
}

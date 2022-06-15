import 'package:everest_walk_groups/features/services/arguments.dart';
import 'package:everest_walk_groups/features/utils/style.dart';
import 'package:everest_walk_groups/models/posts_model.dart';
import 'package:everest_walk_groups/providers/post_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostScreen extends StatefulWidget {
  static const String routeName = '/posts';
  final id;
  const PostScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  Future<List<PostsModel>?>? listOfPost;

  @override
  void initState() {
    super.initState();
    final post = Provider.of<PostProvider>(context, listen: false);
    listOfPost = post.getPosts(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final post = Provider.of<PostProvider>(context).post;

    return SafeArea(
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: FutureBuilder(
            future: listOfPost,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return const Divider(
                      color: Colors.indigoAccent,
                      thickness: 1,
                    );
                  },
                  scrollDirection: Axis.vertical,
                  itemCount: post!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 20, top: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Displaying ID
                          RichText(
                            text: TextSpan(
                              text: "id: ",
                              style: firstRichText,
                              children: [
                                TextSpan(
                                  text: post[index].id.toString(),
                                  style: secondRichText,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          // Displaying UserID
                          RichText(
                            text: TextSpan(
                              text: "userId: ",
                              style: firstRichText,
                              children: [
                                TextSpan(
                                  text: post[index].userId.toString(),
                                  style: secondRichText,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          // Displaying Title
                          RichText(
                            text: TextSpan(
                              text: "title: ",
                              style: firstRichText,
                              children: [
                                TextSpan(
                                  text: post[index].title,
                                  style: secondRichText,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          // Displaying Body
                          RichText(
                            text: TextSpan(
                              text: "body: ",
                              style: firstRichText,
                              children: [
                                TextSpan(
                                  text: post[index].body,
                                  style: secondRichText,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    );
                  },
                );
              }
            }),
      ),
    );
  }
}

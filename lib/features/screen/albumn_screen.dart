import 'package:everest_walk_groups/features/utils/style.dart';
import 'package:everest_walk_groups/models/album_model.dart';
import 'package:everest_walk_groups/providers/albumn_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AlbumnScreen extends StatefulWidget {
  static const String routeName = '/albumns';
  final id;
  const AlbumnScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<AlbumnScreen> createState() => _AlbumnScreenState();
}

class _AlbumnScreenState extends State<AlbumnScreen> {
  Future<List<AlbumModel>?>? listOfAlbum;

  @override
  void initState() {
    super.initState();
    final album = Provider.of<AlbumProvider>(context, listen: false);
    listOfAlbum = album.getAlbum(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final album = Provider.of<AlbumProvider>(context).album;
    return SafeArea(
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: FutureBuilder<List<AlbumModel>?>(
            future: listOfAlbum,
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
                    itemCount: album!.length,
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
                                    text: album[index].id.toString(),
                                    style: secondRichText,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            // Displaying User ID
                            RichText(
                              text: TextSpan(
                                text: "userId: ",
                                style: firstRichText,
                                children: [
                                  TextSpan(
                                    text: album[index].userId.toString(),
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
                                    text: album[index].title,
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
                    });
              }
            }),
      ),
    );
  }
}

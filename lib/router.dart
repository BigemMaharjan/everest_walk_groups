import 'package:everest_walk_groups/features/screen/albumn_screen.dart';
import 'package:everest_walk_groups/features/screen/home_screen.dart';
import 'package:everest_walk_groups/features/screen/post_screen.dart';
import 'package:everest_walk_groups/features/widgets/posts_albums.dart';
import 'package:everest_walk_groups/features/screen/user_detail.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeScreen(),
      );

    case UserDetail.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const UserDetail(),
      );

    case PostAlbum.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const PostAlbum(),
      );

    case PostScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => PostScreen(id: routeSettings.arguments),
      );

    case AlbumnScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => AlbumnScreen(id: routeSettings.arguments),
      );

    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text("Screen does not exist!"),
          ),
        ),
      );
  }
}

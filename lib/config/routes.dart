import 'package:anime_database/models/anime.dart';
import 'package:anime_database/models/review.dart';
import 'package:anime_database/views/pages/my_anime/my_anime.dart';
import 'package:anime_database/views/pages/my_anime/my_anime_index.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String search = 'search';
  static const String myAnimeIndex = 'my_anime_index';
  static const String myAnimeAdd = 'my_anime_add';
  static const String myAnimeEdit = 'my_anime_edit';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case myAnimeIndex:
        return MaterialPageRoute(builder: (_) => const MyAnimeIndex());
      case myAnimeAdd:
        return MaterialPageRoute(builder: (_) => const MyAnime());
      case myAnimeEdit:
        final myAnimeOptions = settings.arguments as Map;
        return MaterialPageRoute(
            builder: (_) => MyAnime(
                  anime: myAnimeOptions['anime'] as Anime,
                  review: myAnimeOptions['review'] as Review,
                ));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text(
                    '${settings.name}は存在しません',
                    style: const TextStyle(fontSize: 20),
                  )),
                ));
    }
  }
}

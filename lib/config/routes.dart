import 'package:anime_database/views/pages/my_anime/my_anime.dart';
import 'package:anime_database/views/pages/my_anime/my_anime_index.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String search = 'search';
  static const String myAnimeIndex = 'my_anime_index';
  static const String myAnime = 'my_anime';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case myAnimeIndex:
        return MaterialPageRoute(builder: (_) => const MyAnimeIndex());
      case myAnime:
        return MaterialPageRoute(builder: (_) => const MyAnime());
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

import 'package:anime_database/models/anime.dart';
import 'package:anime_database/models/anime_particular.dart';
import 'package:anime_database/models/review.dart';
import 'package:anime_database/utils/models/search_anime.dart';
import 'package:anime_database/views/pages/anime_particuar/anime_particular_view.dart';
import 'package:anime_database/views/pages/home.dart';
import 'package:anime_database/views/pages/my_anime/my_anime.dart';
import 'package:anime_database/views/pages/search/search_detail.dart';
import 'package:anime_database/views/pages/search/search_result.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String searchResult = 'search_result';
  static const String searchDetails = 'search_details';
  static const String myAnimeIndex = 'my_anime_index';
  static const String myAnimeAdd = 'my_anime_add';
  static const String myAnimeEdit = 'my_anime_edit';
  static const String animeParticular = 'my_anime_particular';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case myAnimeIndex:
        return MaterialPageRoute(builder: (_) => const Home());
      case myAnimeAdd:
        return MaterialPageRoute(builder: (_) => const MyAnime());
      case myAnimeEdit:
        final myAnimeOptions = settings.arguments as Map;
        return MaterialPageRoute(
            builder: (_) => MyAnime(
                  anime: myAnimeOptions['anime'] as Anime,
                  review: myAnimeOptions['review'] as Review,
                ));
      case searchResult:
        final searchResultOptions = settings.arguments as Map;
        return MaterialPageRoute(
            builder: (_) => SearchResult(
                animes: searchResultOptions['animes'] as List<SearchAnime>));
      case searchDetails:
        final searchDetailOptions = settings.arguments as Map;
        return MaterialPageRoute(
            builder: (_) => SearchDetail(
                  title: searchDetailOptions['title'],
                  officialUrl: searchDetailOptions['official_site_url'],
                  wikipediaUrl: searchDetailOptions['wikipedia_url'],
                ));
      case animeParticular:
        final animeParticularOptions = settings.arguments as Map;
        return MaterialPageRoute(
            builder: (_) => AnimeParticularView(
                animeParticular: animeParticularOptions['anime_particular'] as AnimeParticular));
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

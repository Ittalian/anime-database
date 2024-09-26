import 'package:anime_database/utils/models/search_anime.dart';
import 'package:anime_database/views/widgets/base/base_image_container.dart';
import 'package:anime_database/views/widgets/search/search_result_tile.dart';
import 'package:flutter/widgets.dart';

class SearchResult extends StatelessWidget {
  final List<SearchAnime> animes;

  const SearchResult({super.key, required this.animes});

  @override
  Widget build(BuildContext context) {
    return BaseImageContainer(imagePath: 'images/search_result.jpg', child: SingleChildScrollView(child: Column(children: [
      for (var anime in animes)
        SearchResultTile(anime: anime)
    ],)));
  }
}

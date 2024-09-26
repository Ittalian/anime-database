import 'package:anime_database/config/routes.dart';
import 'package:anime_database/utils/models/search_anime.dart';
import 'package:anime_database/views/widgets/base/base_text.dart';
import 'package:flutter/material.dart';

class SearchResultTile extends StatelessWidget {
  final SearchAnime anime;

  const SearchResultTile({super.key, required this.anime});

  handleShowDetail(BuildContext context, SearchAnime anime) {
		Navigator.pushNamed(
      context,
      Routes.searchDetails,
			arguments: {
				'title': anime.title,
				'official_site_url': anime.officialSiteUrl,
        'wikipedia_url': anime.wikipeidaUrl,
			},
		);
	}

  @override
	Widget build(BuildContext context) {
		return GestureDetector(
			onTap: () => handleShowDetail(context, anime),
			child: Container(
        color: Colors.white,
				margin: const EdgeInsets.all(10),
				padding: const EdgeInsets.all(10),
				child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
					children: [
						Expanded(child: BaseText(value: anime.title, fontSize: 20)),
            const Padding(padding: EdgeInsets.only(left: 10)),
            BaseText(value: '全${anime.episodeCount}話', fontSize: 15)
					]
				)
			)
		);
	}
}

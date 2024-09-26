import 'package:anime_database/config/routes.dart';
import 'package:anime_database/utils/models/search_anime.dart';
import 'package:anime_database/views/widgets/base/base_text.dart';
import 'package:flutter/widgets.dart';

class SearchResultTile extends StatelessWidget {
  final SearchAnime anime;

  const SearchResultTile({super.key, required this.anime});

  handleShowDetail(BuildContext context, SearchAnime anime) {
		Navigator.pushNamed(
      context,
      Routes.searchDetails,
			arguments: {
				'public_url': anime.publicUrl,
				'x_account_url': anime.xAccountUrl,
			},
		);
	}

  @override
	Widget build(BuildContext context) {
		return GestureDetector(
			onTap: () => handleShowDetail(context, anime),
			child: Container(
				margin: const EdgeInsets.all(10),
				padding: const EdgeInsets.all(10),
				child: Column(
					children: [
						BaseText(value: anime.animeTitle, fontSize: 20),
						// BaseText(value: anime.sequel ? 'なし' : 'あり', fontSize: 15),
					]
				)
			)
		);
	}
}

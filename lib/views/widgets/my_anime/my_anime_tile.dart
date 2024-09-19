import 'package:anime_database/config/routes.dart';
import 'package:anime_database/models/anime.dart';
import 'package:anime_database/views/widgets/base/base_text.dart';
import 'package:flutter/material.dart';

class MyAnimeTile extends StatelessWidget {
	final Anime anime;
  const MyAnimeTile({super.key, required this.anime});

	handleEditAnime(BuildContext context, Anime anime) {
		Navigator.pushNamed(
      context,
			Routes.myAnime,
		  arguments: anime,
		);
	}

  @override
	Widget build(BuildContext context) {
		return GestureDetector(
			onTap: () => handleEditAnime(context, anime),
			child: Container(
        alignment: Alignment.center,
        color: Colors.white,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
				child: BaseText(value: anime.title, fontSize: 20)
			)
		);
	}
}

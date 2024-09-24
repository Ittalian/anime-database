import 'package:anime_database/config/routes.dart';
import 'package:anime_database/models/anime.dart';
import 'package:anime_database/models/review.dart';
import 'package:anime_database/view_,models/review_view_model.dart';
import 'package:anime_database/views/widgets/base/base_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyAnimeTile extends StatelessWidget {
  final Anime anime;
  const MyAnimeTile({super.key, required this.anime});

  handleEditAnime(BuildContext context, Anime anime, Review review) {
    Navigator.pushNamed(
      context,
      Routes.myAnimeEdit,
      arguments: {
        'anime': anime,
        'review': review,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final reviewViewModel = context.watch<ReviewViewModel>();
    return GestureDetector(
        onTap: () async {
          final review = await reviewViewModel.getReviewById(anime.animeId!);
          handleEditAnime(
            context,
            anime,
            review,
          );
        },
        child: Container(
            alignment: Alignment.center,
            color: Colors.white,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            child: BaseText(value: anime.title, fontSize: 20)));
  }
}

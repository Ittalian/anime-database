import 'package:anime_database/config/routes.dart';
import 'package:anime_database/models/anime.dart';
import 'package:anime_database/models/review.dart';
import 'package:anime_database/utils/widgets/alert_dialog.dart';
import 'package:anime_database/view_,models/anime_view_model.dart';
import 'package:anime_database/view_,models/review_view_model.dart';
import 'package:anime_database/views/widgets/base/base_button.dart';
import 'package:anime_database/views/widgets/my_anime/progress_bar.dart';
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

  handleDelete(BuildContext context, ReviewViewModel reviewViewModel) async {
    final animeViewModel = context.read<AnimeViewModel>();
    await animeViewModel.deleteAnime(anime.animeId!);
    final review = await reviewViewModel.getReviewById(anime.animeId!);
    reviewViewModel.deleteReview(review.reviewId!);
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
            color: Colors.white.withOpacity(0.5),
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
            margin: const EdgeInsets.all(10),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                BaseText(value: anime.title, fontSize: 20),
                BaseButton(
                    label: '視聴済み',
                    onPressed: () async {
                      AlertMessageDialog.show(context, 'このアニメを視聴済みにしますか？',
                          () async {
                        await handleDelete(context, reviewViewModel);
                      });
                    })
              ]),
              const Padding(padding: EdgeInsets.only(top: 10)),
              ProgressBar(animeId: anime.animeId!),
            ])));
  }
}

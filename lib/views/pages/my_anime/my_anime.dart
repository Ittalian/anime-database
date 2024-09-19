import 'package:anime_database/models/anime.dart';
import 'package:anime_database/models/review.dart';
import 'package:anime_database/view_,models/anime_view_model.dart';
import 'package:anime_database/view_,models/review_view_model.dart';
import 'package:anime_database/views/widgets/base/base_button.dart';
import 'package:anime_database/views/widgets/base/base_image_container.dart';
import 'package:anime_database/views/widgets/base/base_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyAnime extends StatefulWidget {
  final Anime? anime;
  const MyAnime({super.key, this.anime});

  @override
  State<MyAnime> createState() => MyAnimeState();
}

class MyAnimeState extends State<MyAnime> {
  String title = '';
  String reviewText = '';

  handleAdd(AnimeViewModel animeViewModel, ReviewViewModel reviewViewModel,
      String title, String reviewText) async {
    Anime anime = Anime(title: title);
    Review review = Review(animeId: anime.animeId!, value: reviewText);
    await animeViewModel.addAnime(anime);
    await reviewViewModel.addReview(review);
  }

  handleEdit(AnimeViewModel animeViewModel, String animeid, String title,
      String reviewText) async {
    // 	await animeViewModel.updateAnime(animeId, title, review);
  }

  setTitle(String value) {
    setState(() {
      title = value;
    });
  }

  setReviewText(String value) {
    setState(() {
      reviewText = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final animeViewModel = context.read<AnimeViewModel>();
    animeViewModel.fetchAnimes();
    final reviewViewModel = context.read<ReviewViewModel>();
    if (widget.anime != null) {
      reviewViewModel.fetchReviews(widget.anime!.animeId!);
    }

    return BaseImageContainer(
        imagePath: 'images/my_anime.jpg',
        child: Scaffold(
            backgroundColor: Colors.white.withOpacity(0),
            body: Column(children: [
              BaseTextfield(
                  label: 'タイトル', setValue: (value) => setTitle(value)),
              BaseTextfield(
                  label: 'レビュー', setValue: (value) => setReviewText(value)),
              widget.anime == null
                  ? BaseButton(
                      label: '登録',
                      onPressed: () => handleAdd(
                          animeViewModel, reviewViewModel, title, reviewText))
                  : BaseButton(
                      label: '編集',
                      onPressed: () => handleEdit(animeViewModel,
                          widget.anime!.animeId!, title, reviewText)),
            ])));
  }
}

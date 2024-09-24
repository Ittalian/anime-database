import 'package:anime_database/config/routes.dart';
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
  final Review? review;
  const MyAnime({super.key, this.anime, this.review});

  @override
  State<MyAnime> createState() => MyAnimeState();
}

class MyAnimeState extends State<MyAnime> {
  String title = '';
  String reviewText = '';

  handleAdd(AnimeViewModel animeViewModel, ReviewViewModel reviewViewModel,
      String title, String reviewText) async {
    Anime anime = Anime(title: title);
    String animeId = await animeViewModel.addAnime(anime);
    Review review = Review(animeId: animeId, value: reviewText);
    await reviewViewModel.addReview(review);
    Navigator.pushNamed(context, Routes.myAnimeIndex);
  }

  handleEdit(AnimeViewModel animeViewModel, ReviewViewModel reviewViewModel,
      String title, String reviewText) async {
    await animeViewModel.updateAnime(widget.anime!.animeId!, title);
    await reviewViewModel.updateReview(widget.review!.reviewId!, reviewText);
    Navigator.pushNamed(context, Routes.myAnimeIndex);
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
    final animeViewModel = context.watch<AnimeViewModel>();
    animeViewModel.fetchAnimes();
    final reviewViewModel = context.watch<ReviewViewModel>();
    if (widget.anime != null) {
      reviewViewModel.fetchReviews(widget.anime!.animeId!);
    }

    return BaseImageContainer(
        imagePath: 'images/my_anime.jpg',
        child: Scaffold(
            backgroundColor:
                const Color.fromRGBO(255, 255, 255, 1).withOpacity(0),
            body: Column(children: [
              widget.anime == null
                  ? BaseTextfield(
                      label: 'タイトル', setValue: (value) => setTitle(value))
                  : BaseTextfield(
                      label: 'タイトル',
                      initText: widget.anime!.title,
                      setValue: (value) => setTitle(value)),
              widget.review == null
                  ? BaseTextfield(
                      label: 'レビュー', setValue: (value) => setReviewText(value))
                  : BaseTextfield(
                      label: 'レビュー',
                      initText: widget.review!.value,
                      setValue: (value) => setReviewText(value)),
              widget.anime == null || widget.review == null
                  ? BaseButton(
                      label: '登録',
                      onPressed: () => handleAdd(
                          animeViewModel, reviewViewModel, title, reviewText))
                  : BaseButton(
                      label: '編集',
                      onPressed: () => handleEdit(
                          animeViewModel, reviewViewModel, title, reviewText)),
            ])));
  }
}

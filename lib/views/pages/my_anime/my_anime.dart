import 'package:anime_database/config/routes.dart';
import 'package:anime_database/models/anime.dart';
import 'package:anime_database/models/anime_particular.dart';
import 'package:anime_database/models/review.dart';
import 'package:anime_database/utils/widgets/loading_dialog.dart';
import 'package:anime_database/view_,models/anime_particular_view_model.dart';
import 'package:anime_database/view_,models/anime_view_model.dart';
import 'package:anime_database/view_,models/review_view_model.dart';
import 'package:anime_database/views/widgets/base/base_button.dart';
import 'package:anime_database/views/widgets/base/base_image_container.dart';
import 'package:anime_database/views/widgets/base/base_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../utils/constants/my_anime_constants.dart' as my_anime;

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

  @override
  void initState() {
    super.initState();
    if (widget.anime != null) {
      title = widget.anime!.title;
    }
    if (widget.review != null) {
      reviewText = widget.review!.value;
    }
  }

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

  moveAnimeParticular(AnimeParticular animeParticular) {
    Navigator.pushNamed(context, Routes.animeParticular, arguments: {
      'anime_particular': animeParticular,
    });
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
    final animeParticularViewModel = context.watch<AnimeParticularViewModel>();
    final reviewViewModel = context.watch<ReviewViewModel>();
    if (widget.anime != null) {
      reviewViewModel.fetchReviews(widget.anime!.animeId!);
    }

    return BaseImageContainer(
        imagePath: 'images/my_anime.jpg',
        child: Scaffold(
          backgroundColor:
              const Color.fromRGBO(255, 255, 255, 1).withOpacity(0),
          body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            widget.anime == null
                ? BaseTextfield(
                    label: my_anime.labelText['title']!,
                    setValue: (value) => setTitle(value))
                : BaseTextfield(
                    label: my_anime.labelText['title']!,
                    initText: widget.anime!.title,
                    setValue: (value) => setTitle(value)),
            widget.review == null
                ? BaseTextfield(
                    label: my_anime.labelText['review']!,
                    setValue: (value) => setReviewText(value))
                : BaseTextfield(
                    label: my_anime.labelText['review']!,
                    initText: widget.review!.value,
                    setValue: (value) => setReviewText(value)),
            widget.anime == null || widget.review == null
                ? BaseButton(
                    label: my_anime.labelText['add']!,
                    onPressed: () async {
                      await LoadingDialog.show(context, my_anime.saving);
                      handleAdd(
                          animeViewModel, reviewViewModel, title, reviewText);
                    })
                : BaseButton(
                    label: my_anime.labelText['edit']!,
                    onPressed: () async {
                      await LoadingDialog.show(context, my_anime.editing);
                      handleEdit(
                          animeViewModel, reviewViewModel, title, reviewText);
                    }),
          ]),
          floatingActionButton: widget.anime == null
              ? null
              : FloatingActionButton(
                  onPressed: () async {
                    try {
                      AnimeParticular? animeParticular =
                          await animeParticularViewModel
                              .getAnimeParticularById(widget.anime!.animeId!);
                      moveAnimeParticular(animeParticular!);
                    } catch (e) {
                      moveAnimeParticular(AnimeParticular(
                        animeId: widget.anime!.animeId!,
                        latestStory: 0,
                        currentStory: 0,
                        dateId: 0,
                      ));
                    }
                  },
                  child: const Text(my_anime.progress,
                      style: TextStyle(fontSize: 20)),
                ),
        ));
  }
}

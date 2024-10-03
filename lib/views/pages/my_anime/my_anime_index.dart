import 'package:anime_database/config/routes.dart';
import 'package:anime_database/view_,models/anime_view_model.dart';
import 'package:anime_database/views/widgets/base/base_image_container.dart';
import 'package:anime_database/views/widgets/my_anime/my_anime_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyAnimeIndex extends StatelessWidget {
  const MyAnimeIndex({super.key});

  handleAddAnime(BuildContext context) {
    Navigator.pushNamed(
      context,
      Routes.myAnimeAdd,
    );
  }

  @override
  Widget build(BuildContext context) {
    final animeViewModel = context.watch<AnimeViewModel>();
    animeViewModel.fetchAnimes();

    return BaseImageContainer(
      imagePath: 'images/my_anime_index.jpg',
      child: Scaffold(
          backgroundColor: Colors.white.withOpacity(0),
          body: PopScope(
              canPop: false,
              child: SingleChildScrollView(
                  child: Column(children: [
                for (var anime in animeViewModel.animes)
                  MyAnimeTile(anime: anime),
              ]))),
          floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () => handleAddAnime(context))),
    );
  }
}

import 'package:anime_database/models/anime.dart';
import 'package:anime_database/repositories/anime_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AnimeViewModel extends ChangeNotifier {
  final AnimeRepository animeRepository;

  List<Anime> _animes = [];
  List<Anime> get animes => _animes;

  AnimeViewModel(this.animeRepository) {
    fetchAnimes();
  }

  void fetchAnimes() {
    animeRepository.getAnimes().listen((animeList) {
      _animes = animeList;
      notifyListeners();
    });
  }

  Future<String> addAnime(Anime anime) async {
    return await animeRepository.addAnime(anime);
  }
}

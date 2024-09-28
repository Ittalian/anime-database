import 'package:anime_database/models/anime_particular.dart';
import 'package:anime_database/repositories/anime_particular_repository.dart';
import 'package:flutter/foundation.dart';

class AnimeParticularViewModel extends ChangeNotifier {
  final AnimeParticularRepository animeParticularRepository;

  List<AnimeParticular> _animeParticulars = [];
  List<AnimeParticular> get animeParticulars => _animeParticulars;

  AnimeParticularViewModel(this.animeParticularRepository);

  Future<void> fetchAnimeParticulars() async {
    animeParticularRepository
        .getAnimeParticulars()
        .listen((animeParticularList) {
      _animeParticulars = animeParticularList;
      notifyListeners();
    });
  }

  Future<AnimeParticular> getAnimeParticularById(String animeId) async {
    return await animeParticularRepository.getAnimeParticularById(animeId);
  }

  Future<String> addAnimeParticular(AnimeParticular animeParticular) async {
    return await animeParticularRepository.addAnimeParticular(animeParticular);
  }

  Future<void> updateAnimeParticular(String animeParticularId, int latestStory,
      int currentStory, int dateId) async {
    return await animeParticularRepository.updateAnime(
        animeParticularId, latestStory, currentStory, dateId);
  }

  Future<void> deleteAnimeParticluar(String reviewId) async {
    return await animeParticularRepository.deleteAnime(reviewId);
  }
}

import 'package:anime_database/models/anime_particular.dart';
import 'package:anime_database/services/anime_particular_service.dart';

class AnimeParticularRepository {
  final AnimeParticularService animeParticularService;
  AnimeParticularRepository(this.animeParticularService);

  Stream<List<AnimeParticular>> getAnimeParticulars() {
    return animeParticularService.getAnimeParticulars();
  }

  Future<String> addAnimeParticular(AnimeParticular animeParticular) {
    return animeParticularService.addAnimeParticular(animeParticular);
  }

  Future<AnimeParticular?> getAnimeParticularById(String animeId) {
    return animeParticularService.getAnimeParticularById(animeId);
  }

  Future<void> updateAnimeParticular(
      String animeId, int latestStory, int currentStory, int date) {
    return animeParticularService.updateAnimeParticular(
        animeId, latestStory, currentStory, date);
  }

  Future<void> deleteAnimeParticular(String animeId) {
    return animeParticularService.deleteAnimeParticular(animeId);
  }
}

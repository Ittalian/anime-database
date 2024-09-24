import 'package:anime_database/models/anime.dart';
import 'package:anime_database/services/anime_service.dart';

class AnimeRepository {
  final AnimeService animeService;

  AnimeRepository(this.animeService);

  Stream<List<Anime>> getAnimes() {
    return animeService.getAnimes();
  }

  Future<String> addAnime(Anime anime) {
    return animeService.addAnime(anime);
  }

  Future<Anime> getAnimeById(String animeId) {
    return animeService.getAnimeById(animeId);
  }

  Future<void> updateAnime(String animeId, String title) {
    return animeService.updateAnime(animeId, title);
  }
}

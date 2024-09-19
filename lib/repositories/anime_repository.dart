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
}

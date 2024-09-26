class SearchAnime {
  String title;
  int episodeCount;
  String? officialSiteUrl;
  String? wikipeidaUrl;

  SearchAnime({
    required this.title,
    required this.episodeCount,
    this.officialSiteUrl,
    this.wikipeidaUrl,
  });
}

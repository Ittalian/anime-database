class SearchAnime {
  String title;
  int episodeCount;
  String? officialSiteUrl;
  String? wikipeidaUrl;
  String imageUrl;

  SearchAnime({
    required this.title,
    required this.episodeCount,
    this.officialSiteUrl,
    this.wikipeidaUrl,
    required this.imageUrl,
  });
}

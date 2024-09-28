class AnimeParticular {
  final String? animeParticularId;
  final String animeId;
  final int latestStory;
  final int curretStory;

  AnimeParticular({
    this.animeParticularId,
    required this.animeId,
    required this.latestStory,
    required this.curretStory,
  });

  factory AnimeParticular.fromMap(Map<String, dynamic> map, String documentId) {
    return AnimeParticular(
      animeParticularId: documentId,
      animeId: map['anime_id'] ?? '',
      latestStory: map['latest_story'] as int,
      curretStory: map['current_story'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'anime_id': animeId,
      'latest_story': latestStory,
      'current_story': curretStory,
    };
  }
}

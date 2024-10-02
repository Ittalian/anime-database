class AnimeParticular {
  final String? animeParticularId;
  final String animeId;
  final int latestStory;
  final int currentStory;
  final int dateId;

  AnimeParticular({
    this.animeParticularId,
    required this.animeId,
    required this.latestStory,
    required this.currentStory,
    required this.dateId,
  });

  factory AnimeParticular.fromMap(Map<String, dynamic> map, String documentId) {
    return AnimeParticular(
      animeParticularId: documentId,
      animeId: map['anime_id'] ?? '',
      latestStory: map['latest_story'] as int,
      currentStory: map['current_story'] as int,
      dateId: map['date_id'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'anime_id': animeId,
      'latest_story': latestStory,
      'current_story': currentStory,
      'date_id': dateId,
    };
  }
}

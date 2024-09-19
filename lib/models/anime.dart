class Anime {
  String? animeId;
  String title;

  Anime({
    this.animeId,
    required this.title,
  });

  factory Anime.fromMap(Map<String, dynamic> map, String documentId) {
    return Anime(
        animeId: documentId,
        title: map['title'] ?? '');
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
    };
  }
}

class Review {
  String? reviewId;
  String animeId;
  String value;

  Review({
    this.reviewId,
    required this.animeId,
    required this.value,
  });

  factory Review.fromMap(Map<String, dynamic> map, String documentId) {
    return Review(reviewId: documentId, animeId: map['anime_id'] ?? '', value: map['value'] ?? '');
  }

  Map<String, dynamic> toMap() {
    return {
      'anime_id': animeId,
      'value': value,
    };
  }
}

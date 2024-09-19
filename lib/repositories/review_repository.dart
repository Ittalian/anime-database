import 'package:anime_database/models/review.dart';
import 'package:anime_database/services/review_service.dart';

class ReviewRepository {
  final ReviewService reviewService;

  ReviewRepository(this.reviewService);

  Stream<List<Review>> getReview(String animeId) {
    return reviewService.getReviews(animeId);
  }

  Future<String> addReview(Review review) {
    return reviewService.addReview(review);
  }
}

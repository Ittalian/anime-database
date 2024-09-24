import 'package:anime_database/models/review.dart';
import 'package:anime_database/services/review_service.dart';

class ReviewRepository {
  final ReviewService reviewService;

  ReviewRepository(this.reviewService);

  Stream<List<Review>> getReview(String animeId) {
    return reviewService.getReviews(animeId);
  }

  Future<Review> getReviewById(String reviewId) {
    return reviewService.getReviewById(reviewId);
  }

  Future<String> addReview(Review review) {
    return reviewService.addReview(review);
  }

  Future<void> updateReview(String reviewId, String value) {
    return reviewService.updateReview(reviewId, value);
  }

  Future<void> deleteReview(String reviewId) {
    return reviewService.deleteReview(reviewId);
  }
}

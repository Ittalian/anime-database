import 'package:anime_database/models/review.dart';
import 'package:anime_database/repositories/review_repository.dart';
import 'package:flutter/foundation.dart';

class ReviewViewModel extends ChangeNotifier {
  final ReviewRepository reviewRepository;

  List<Review> _reviews = [];
  List<Review> get reviews => _reviews;

  ReviewViewModel(this.reviewRepository);

  Future<void> fetchReviews(String animeId) async {
    reviewRepository.getReview(animeId).listen((reviewList) {
      _reviews = reviewList;
      notifyListeners();
    });
  }

  Future<Review> getReviewById(String reviewId) async {
    return await reviewRepository.getReviewById(reviewId);
  }

  Future<String> addReview(Review review) async {
    return await reviewRepository.addReview(review);
  }

  Future<void> updateReview(String reviewId, String value) async {
    return await reviewRepository.updateReview(reviewId, value);
  }
}

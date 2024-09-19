import 'package:anime_database/models/review.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ReviewService {
  final CollectionReference<Map<String, dynamic>> db =
      FirebaseFirestore.instance.collection('Review');

  Stream<List<Review>> getReviews(String animeId) {
    return db.where('anime_id', isEqualTo: animeId).snapshots().map(
        (snapshot) => snapshot.docs
            .map((doc) => Review.fromMap(doc.data(), doc.id))
            .toList());
  }

  Future<String> addReview(Review review) async {
    DocumentReference ref = await db.add(review.toMap());
    return ref.id;
  }
}

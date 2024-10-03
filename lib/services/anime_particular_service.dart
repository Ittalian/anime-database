import 'package:anime_database/models/anime_particular.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AnimeParticularService {
  final CollectionReference<Map<String, dynamic>> db =
      FirebaseFirestore.instance.collection('AnimeParticular');

  Stream<List<AnimeParticular>> getAnimeParticulars() {
    return db.snapshots().map((snapshot) => snapshot.docs
        .map((doc) => AnimeParticular.fromMap(doc.data(), doc.id))
        .toList());
  }

  Future<String> addAnimeParticular(AnimeParticular animeParticular) async {
    DocumentReference ref = await db.add(animeParticular.toMap());
    return ref.id;
  }

  Future<AnimeParticular> getAnimeParticularById(String animeId) async {
    try {
      final snapshot = await db.where('anime_id', isEqualTo: animeId).get();
      if (snapshot.docs.isNotEmpty) {
        final doc = snapshot.docs.first;
        return AnimeParticular.fromMap(doc.data(), doc.id);
      } else {
        throw Exception('No data found for animeId: $animeId');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateAnimeParticular(String animeParticularId, int latestStory,
      int currentStory, int date) async {
    try {
      await db.doc(animeParticularId).update({
        'latest_story': latestStory,
        'current_story': currentStory,
        'date_id': date,
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteAnimeParticular(String animeId) async {
    try {
      await db.doc(animeId).delete();
    } catch (e) {
      print(e);
    }
  }
}

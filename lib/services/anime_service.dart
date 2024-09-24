import 'package:anime_database/models/anime.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AnimeService {
  final CollectionReference<Map<String, dynamic>> db =
      FirebaseFirestore.instance.collection('Anime');

  Stream<List<Anime>> getAnimes() {
    return db.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Anime.fromMap(doc.data(), doc.id)).toList());
  }

  Future<String> addAnime(Anime anime) async {
    DocumentReference ref = await db.add(anime.toMap());
    return ref.id;
  }

  Future<Anime> getAnimeById(String animeId) async {
    DocumentSnapshot<Map<String, dynamic>> doc = await db.doc(animeId).get();
    return Anime.fromMap(doc.data()!, doc.id);
  }

  Future<void> updateAnime(String animeId, String title) async {
    try {
      await db.doc(animeId).update({
        'title': title,
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteAnime(String animeId) async {
    try {
      await db.doc(animeId).delete();
    } catch (e) {
      print(e);
    }
  }
}

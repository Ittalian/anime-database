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
}

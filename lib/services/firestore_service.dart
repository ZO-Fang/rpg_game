import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rpg_game/model/character.dart';

class FirestoreService {

  static final ref = FirebaseFirestore.instance.collection('characters').withConverter(
    fromFirestore: Character.fromFirestore,
    toFirestore: (Character c, _) => c.toFirestore()
  );

  //add a new character
  static Future<void> addCharacter(Character character) async {
    await ref.doc(character.id).set(character);
  }

  //get characters once
static Future<QuerySnapshot<Character>> getCharactersOnce() {
    return ref.get();
}

//update a character
static Future<void> updateCharacter(Character character) async {
    await ref.doc(character.id).update({
      'stats': character.statsAsMap,
      'points': character.points,
      'skills': character.skills.map((s) => s.id).toList(),
      'isFav': character.isFav
    });
}

//delete a character
static Future<void> deleteCharacter(Character character) async {
    await ref.doc(character.id).delete();
}

}
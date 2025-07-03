import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:rpg_game/model/character.dart';
import 'package:rpg_game/model/vocation.dart';
import 'package:rpg_game/services/firestore_service.dart';

class CharacterStore extends ChangeNotifier {

  // final List<Character> _characters = [
  //   Character(id: '1', name: 'Klara', vocation: Vocation.witch, slogan: 'Magic flows through me!'),
  //   Character(id: '2', name: 'Marcus', vocation: Vocation.warrior, slogan: 'Steel and honor!'),
  //   Character(id: '3', name: 'Aria', vocation: Vocation.archer, slogan: 'One shot, one kill!'),
  //   Character(id: '4', name: 'Raven', vocation: Vocation.assassin, slogan: 'Death from the shadows!'),
  //   Character(id: '5', name: 'Gareth', vocation: Vocation.paladin, slogan: 'Light shall prevail!'),
  // ];

  final List<Character> _characters = [];


  get characters => _characters;

  //add character
  void addCharacter(Character character) {
    FirestoreService.addCharacter(character);

    _characters.add(character);
    notifyListeners();
  }

  //update character
  Future<void> saveCharacter(Character character) async {
    await FirestoreService.updateCharacter(character);
    return;
  }

  //delete a character
  void removeCharacter(Character character) async {
    await FirestoreService.deleteCharacter(character);

    _characters.remove(character);
    notifyListeners();
  }


  //initially fetch characters
  void fetchCharactersOnce() async {
    if (characters.length == 0){
      final snapshot = await FirestoreService.getCharactersOnce();

      for (var doc in snapshot.docs) {
        _characters.add(doc.data());
      }
      notifyListeners();
    }
  }


}
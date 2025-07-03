import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rpg_game/model/skill.dart';
import 'package:rpg_game/model/stats.dart';
import 'package:rpg_game/model/vocation.dart';


//Character 类会获得 Stats 中的所有字段和方法
// 就像把 Stats 的代码直接复制粘贴到 Character 类里一样
class Character with Stats {

  //constructor
  Character({
    required this.name, required this.vocation, required this.slogan, required this.id
});

  //fields
  final String name;
  final Vocation vocation;
  final Set<Skill> skills = {};
  final String slogan;
  final String id;
  bool _isFav = false;
  //dart里field默认是public，但如果名字前加了下划线，那么就是private
  //_isFav是private, name是public

  //getters
  get isFav => _isFav;
  //它等价于：
  //bool get isFav {
  //   return _isFav;
  // }


  //method
  void toggleIsFav() {
    _isFav = !_isFav;
  }

  void updateSkill(Skill skill) {
    skills.clear();
    skills.add(skill);
  }

  //character to firestore
Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'slogan': slogan,
      'isFav': _isFav,
      'vocation': vocation.toString(),
      'skills': skills.map((s) => s.id).toList(),
      'stats': statsAsMap,
      'points': points
    };
}

//这个 toFirestore() 方法的作用就是把一个 Character 对象转换成一个 Map，
// 这个 Map 的 key 是 String 类型（字段名），value 是 dynamic 类型
// （值可以是任何类型，如 String、bool、List、Map 等），从而便于上传到
// Firebase Firestore 数据库。


//character from firestore
factory Character.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options
    ) {
    //get data from snapshot
  final data = snapshot.data()!;

  //make character instance
  Character character = Character(
    name: data['name'],
    slogan: data['slogan'],
    id: snapshot.id,
    vocation: Vocation.values.firstWhere((element) => element.toString() == data['vocation'])
  );

  //update skills
  for(String id in data['skills']) {
    Skill skill = allSkills.firstWhere((element) => element.id == id);
    character.updateSkill(skill);
  }

  //set isFav
  if (data['isFav'] == true){
    character.toggleIsFav();
  }

  //assign stats and points
  character.setStats(point: data['points'], stats: data['stats']);

  return character;
}
}


//dummy character data
List<Character> characters = [
  Character(id: '1', name: 'Klara', vocation: Vocation.witch, slogan: 'Magic flows through me!'),
  Character(id: '2', name: 'Marcus', vocation: Vocation.warrior, slogan: 'Steel and honor!'),
  Character(id: '3', name: 'Aria', vocation: Vocation.archer, slogan: 'One shot, one kill!'),
  Character(id: '4', name: 'Raven', vocation: Vocation.assassin, slogan: 'Death from the shadows!'),
  Character(id: '5', name: 'Gareth', vocation: Vocation.paladin, slogan: 'Light shall prevail!'),
];
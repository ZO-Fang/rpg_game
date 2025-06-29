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

  void updatedSkill(Skill skill) {
    skills.clear();
    skills.add(skill);
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
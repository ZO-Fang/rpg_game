import 'package:rpg_game/model/vocation.dart';

class Skill {
  final String id;
  final String name;
  final String image;
  final Vocation vocation;

  Skill({
    required this.id,
    required this.name,
    required this.image,
    required this.vocation
});
}

final List<Skill> allSkills = [
  // valley witch skills
  Skill(id: '1', name: 'Lightning Bolt', image: 'magic1.jpg', vocation: Vocation.witch),
  Skill(id: '2', name: 'Frost Shield', image: 'magic2.jpg', vocation: Vocation.witch),
  Skill(id: '3', name: 'Arcane Missile', image: 'magic3.jpg', vocation: Vocation.witch),
  Skill(id: '4', name: 'Teleport', image: 'magic4.jpg', vocation: Vocation.witch),

  // iron warrior skills
  Skill(id: '5', name: 'Power Strike', image: 'wa1.jpg', vocation: Vocation.warrior),
  Skill(id: '6', name: 'Shield Bash', image: 'wa2.jpg', vocation: Vocation.warrior),
  Skill(id: '7', name: 'Berserker Rage', image: 'wa3.jpg', vocation: Vocation.warrior),
  Skill(id: '8', name: 'Iron Defense', image: 'wa4.jpg', vocation: Vocation.warrior),

  // forest ranger skills
  Skill(id: '9', name: 'Eagle Eye', image: 'ar1.jpg', vocation: Vocation.archer),
  Skill(id: '10', name: 'Multi Shot', image: 'ar2.jpg', vocation: Vocation.archer),
  Skill(id: '11', name: 'Poison Arrow', image: 'ar3.jpg', vocation: Vocation.archer),
  Skill(id: '12', name: 'Rain of Arrows', image: 'ar4.jpg', vocation: Vocation.archer),

  // shadow blade skills
  Skill(id: '13', name: 'Shadow Step', image: 'ass1.jpg', vocation: Vocation.assassin),
  Skill(id: '14', name: 'Critical Strike', image: 'ass2.jpg', vocation: Vocation.assassin),
  Skill(id: '15', name: 'Smoke Bomb', image: 'ass3.jpg', vocation: Vocation.assassin),
  Skill(id: '16', name: 'Backstab', image: 'ass4.jpg', vocation: Vocation.assassin),

  // holy knight skills
  Skill(id: '17', name: 'Divine Light', image: 'pa1.jpg', vocation: Vocation.paladin),
  Skill(id: '18', name: 'Healing Prayer', image: 'pa2.jpg', vocation: Vocation.paladin),
  Skill(id: '19', name: 'Holy Strike', image: 'pa3.jpg', vocation: Vocation.paladin),
  Skill(id: '20', name: 'Sacred Shield', image: 'pa4.jpg', vocation: Vocation.paladin),
];
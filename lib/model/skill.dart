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
  Skill(id: '1', name: 'Lightning Bolt', image: 'lightning_bolt.jpg', vocation: Vocation.witch),
  Skill(id: '2', name: 'Frost Shield', image: 'frost_shield.jpg', vocation: Vocation.witch),
  Skill(id: '3', name: 'Arcane Missile', image: 'arcane_missile.jpg', vocation: Vocation.witch),
  Skill(id: '4', name: 'Teleport', image: 'teleport.jpg', vocation: Vocation.witch),

  // iron warrior skills
  Skill(id: '5', name: 'Power Strike', image: 'power_strike.jpg', vocation: Vocation.warrior),
  Skill(id: '6', name: 'Shield Bash', image: 'shield_bash.jpg', vocation: Vocation.warrior),
  Skill(id: '7', name: 'Berserker Rage', image: 'berserker_rage.jpg', vocation: Vocation.warrior),
  Skill(id: '8', name: 'Iron Defense', image: 'iron_defense.jpg', vocation: Vocation.warrior),

  // forest ranger skills
  Skill(id: '9', name: 'Eagle Eye', image: 'eagle_eye.jpg', vocation: Vocation.archer),
  Skill(id: '10', name: 'Multi Shot', image: 'multi_shot.jpg', vocation: Vocation.archer),
  Skill(id: '11', name: 'Poison Arrow', image: 'poison_arrow.jpg', vocation: Vocation.archer),
  Skill(id: '12', name: 'Rain of Arrows', image: 'rain_arrows.jpg', vocation: Vocation.archer),

  // shadow blade skills
  Skill(id: '13', name: 'Shadow Step', image: 'shadow_step.jpg', vocation: Vocation.assassin),
  Skill(id: '14', name: 'Critical Strike', image: 'critical_strike.jpg', vocation: Vocation.assassin),
  Skill(id: '15', name: 'Smoke Bomb', image: 'smoke_bomb.jpg', vocation: Vocation.assassin),
  Skill(id: '16', name: 'Backstab', image: 'backstab.jpg', vocation: Vocation.assassin),

  // holy knight skills
  Skill(id: '17', name: 'Divine Light', image: 'divine_light.jpg', vocation: Vocation.paladin),
  Skill(id: '18', name: 'Healing Prayer', image: 'healing_prayer.jpg', vocation: Vocation.paladin),
  Skill(id: '19', name: 'Holy Strike', image: 'holy_strike.jpg', vocation: Vocation.paladin),
  Skill(id: '20', name: 'Sacred Shield', image: 'sacred_shield.jpg', vocation: Vocation.paladin),
];
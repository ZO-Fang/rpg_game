enum Vocation {
  witch(
      title: "Valley Witch",
      description: "live in valley",
      weapon: "magic wand",
      ability: "magic",
      image: "witch.jpg"
  ),
  warrior(
      title: "Iron Warrior",
      description: "fearless fighter from the mountains",
      weapon: "steel sword",
      ability: "combat mastery",
      image: "warrior.jpg"
  ),
  archer(
      title: "Forest Ranger",
      description: "silent hunter of the deep woods",
      weapon: "longbow",
      ability: "precision shot",
      image: "archer.jpg"
  ),
  assassin(
      title: "Shadow Blade",
      description: "moves like wind in the darkness",
      weapon: "twin daggers",
      ability: "stealth strike",
      image: "assassin.jpg"
  ),
  paladin(
      title: "Holy Knight",
      description: "divine protector of the innocent",
      weapon: "blessed hammer",
      ability: "holy light",
      image: "paladin.jpg"
  );

  const Vocation({
    required this.title,
    required this.description,
    required this.image,
    required this.weapon,
    required this.ability
  });

  final String title;
  final String description;
  final String image;
  final String weapon;
  final String ability;
}
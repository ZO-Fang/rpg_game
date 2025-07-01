mixin Stats {
  int _points = 10;
  int _health = 10;
  int _attack = 10;
  int _defense = 10;
  int _skill = 10;

  //getters
  int get points => _points;

  //适合程序内部使用，数值是 int 类型
  Map<String, int> get statsAsMap => {
    "health": _health,
    "attack": _attack,
    "defense": _defense,
    "skill": _skill,
  };

  //适合 UI 显示，所有值都是 String 类型，方便在界面上展示
  //这里使用list是为了配合ListView.builder来渲染列表
  List<Map<String, String>> get statsAsFormattedList => [
    {'title': 'health', 'value': _health.toString()},
    {'title': 'attack', 'value': _attack.toString()},
    {'title': 'defense', 'value': _defense.toString()},
    {'title': 'skill', 'value': _skill.toString()},
  ];

  //methods
  void increaseStat(String stat) {
    if(_points > 0) {
      if(stat == 'health') {
        _health++;
      }
      if (stat == 'attack') {
        _attack++;
      }
      if (stat == 'defense'){
        _defense++;
      }
      if (stat == 'skill'){
        _skill++;
      }

      //当有某个数字增加了，那么point就会相应减少
      _points--;
    }
  }

  void decreaseStat(String stat){
    if(stat == 'health' && _health > 5) {
      _health--;
    }
    if(stat == 'attack' && _attack > 5) {
      _attack--;
    }
    if(stat == 'defense' && _defense > 5) {
      _defense--;
    }
    if(stat == 'skill' && _skill > 5) {
      _skill--;
    }

    //如果某个数字减少了，那么能用的points会相应增加
    _points++;
  }
}
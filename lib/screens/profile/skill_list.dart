import 'package:flutter/material.dart';
import 'package:rpg_game/model/character.dart';
import 'package:rpg_game/model/skill.dart';
import 'package:rpg_game/shared/styled_text.dart';
import 'package:rpg_game/theme.dart';

class SkillList extends StatefulWidget {
  const SkillList({
    super.key,
    required this.hero
  });

  final Character hero;

  @override
  State<SkillList> createState() => _SkillListState();
}

class _SkillListState extends State<SkillList> {
  late List<Skill> availableSkills;
  //late是延迟初始化，也就是不在声明时初始化，但会在使用前初始化

  @override
  void initState() {
    availableSkills = allSkills.where((skill) {
      return skill.vocation == widget.hero.vocation;
    }).toList();

    /**
     * initState() 是 Flutter StatefulWidget 的生命周期方法之一。
     * 当这个 widget 第一次被创建时会调用这个方法，通常用来：
        初始化数据
        设置监听器
        进行一次性的设置操作
     * */

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        color: AppColors.orange.withAlpha(30),
        child: Column(
          children: [
            const StyledHeading('Chooese an active skill'),
            const StyledText('Skills are unique to your vovation'),
            const SizedBox(height: 20),
          ]
        )
      )
    );
  }
}

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

  late Skill selectedSkill;

  @override
  void initState() {

    availableSkills = allSkills.where((skill) {
      return skill.vocation == widget.hero.vocation;
    }).toList();
    //allSkills 是一个 List<Skill>（技能列表）
    // .where() 方法会逐个遍历这个列表中的每一个元素
    // 每次遍历时，当前的那个 Skill 对象就被临时命名为 skill
    // 然后检查这个 skill.vocation 是否等于 widget.hero.vocation
    //如果返回true,那么这个技能会被保留，返回false，则这个技能被过滤掉
    //where() 最终会返回一个包含所有符合条件的技能的可迭代对象

    /**
     * initState() 是 Flutter StatefulWidget 的生命周期方法之一。
     * 当这个 widget 第一次被创建时会调用这个方法，通常用来：
        初始化数据
        设置监听器
        进行一次性的设置操作
     * */


    if (widget.hero.skills.isEmpty) {
      selectedSkill = availableSkills[0];
    }

    if (widget.hero.skills.isNotEmpty) {
      selectedSkill = widget.hero.skills.first;
    }

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
            const StyledText('Skills are unique to your vocation'),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,  // 让子元素水平居中排列
              children: availableSkills.map((skill) {
                return Container(
                  margin: const EdgeInsets.all(2),
                  padding: const EdgeInsets.all(2),
                  color: skill == selectedSkill ? AppColors.orange : Colors.transparent,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.hero.updateSkill(skill);
                        selectedSkill = skill;
                      });
                    },

                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: SizedBox(
                          width: 70,
                          height: 70,
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: Image.asset('assets/img/skills/${skill.image}'),
                          ),
                        ),
                    ),
                  )
                  );
              }).toList(),
            ),
            const SizedBox(height: 10),
            StyledText(selectedSkill.name)
          ]
        )
      )
    );
  }
}

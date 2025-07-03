import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rpg_game/model/character.dart';
import 'package:rpg_game/screens/profile/skill_list.dart';
import 'package:rpg_game/screens/profile/stats_table.dart';
import 'package:rpg_game/services/character_store.dart';
import 'package:rpg_game/shared/styled_button.dart';
import 'package:rpg_game/shared/styled_text.dart';
import 'package:rpg_game/theme.dart';

class Profile extends StatelessWidget {
  const Profile({
    super.key,
    required this.character
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StyledTitle(character.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //介绍角色的详细信息
            Container(
              padding: const EdgeInsets.all(16),
              color: AppColors.orange,
              child: Row(
                children: [
                  Image.asset('assets/img/vocations/${character.vocation.image}',
                  width: 140,
                  height: 140,
                  fit: BoxFit.cover, // 图片会被裁剪以填满整个区域，保持宽高比
                  alignment: Alignment.topCenter, // 从顶部中心开始显示
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StyledHeading(character.vocation.title),
                        StyledText(character.vocation.description)
                      ]
                    )
                  )
                ]
              )
            ),

            const SizedBox(height: 20),
            Center(child: Icon(Icons.stadium, color: AppColors.orange)),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const StyledHeading('Slogan'),
                    StyledText(character.slogan),
                    const SizedBox(height: 10),

                    const StyledHeading('Weapon'),
                    StyledText(character.vocation.weapon),
                    const SizedBox(height: 10),

                    const StyledHeading('Ability'),
                    StyledText(character.vocation.ability),
                    const SizedBox(height: 10),
                  ]
                )
              )
            ),

            //下面放具体的角色技能
            Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  StatsTable(hero: character),
                  //这里，把character传送到参数名hero里
                  SkillList(hero: character)
                ]
              )
            ),

            StyledButton(
              onPressed: () {
                Provider.of<CharacterStore>(context, listen: false).saveCharacter(character);

                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: const StyledHeading('Character saved!'),
                  showCloseIcon: true,
                  duration: const Duration(seconds: 2),
                  backgroundColor: AppColors.orange,
                ));
              },
              label : 'Save Character',
            ),
            const SizedBox(height: 15),

            StyledButton(
              onPressed: () {
                Provider.of<CharacterStore>(context, listen: false).removeCharacter(character);

                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: const StyledHeading('Character deleted!'),
                  showCloseIcon: true,
                  duration: const Duration(seconds: 2),
                  backgroundColor: AppColors.orange,
                ));
              },
              label : 'Delete Character',
            ),

            const SizedBox(height: 20)

          ]
        )
      )
    );
  }
}

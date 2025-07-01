import 'package:flutter/material.dart';
import 'package:rpg_game/model/character.dart';
import 'package:rpg_game/screens/profile/profile.dart';
import 'package:rpg_game/shared/styled_text.dart';
import 'package:rpg_game/theme.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard(this.character, {super.key});
  //这个this.character是关心顺序的，在花括号外面

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Image.asset('assets/img/vocations/${character.vocation.image}',
              width: 80,
              height: 80,
              fit: BoxFit.cover, // 图片会被裁剪以填满整个区域，保持宽高比
              alignment: Alignment.topCenter, // 从顶部中心开始显示
            ),

            const SizedBox(width:20),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StyledHeading(character.name),
                StyledText(character.vocation.title),
              ]
            ),

            Expanded(
              child: SizedBox()
            ),
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (ctx) => Profile(character: character),
                ));
              },
              icon: Icon(Icons.account_box_outlined, color: AppColors.orange)
            )
          ],
        ),
      ),
    );
  }
}

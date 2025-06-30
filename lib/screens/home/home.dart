import 'package:flutter/material.dart';
import 'package:rpg_game/model/character.dart';
import 'package:rpg_game/screens/create/create.dart';
import 'package:rpg_game/shared/styled_text.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rpg_game/shared/styled_button.dart';
import 'package:rpg_game/screens/home/character_card.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StyledTitle('Your Characters'),
        centerTitle: true
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child:
                ListView.builder(
                  itemCount: characters.length,
                  itemBuilder: (_, index) {   //这里的_是指不需要用BuildContext context这个参数
                    return CharacterCard(characters[index]);
                  },
                ),
              ),

              StyledButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (ctx) => Create()
                    ));
                  },
                  label: 'create new'
                )
              ],
            ),
        )
      );
  }
}

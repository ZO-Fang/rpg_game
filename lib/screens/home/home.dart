import 'package:flutter/material.dart';
import 'package:provider/provider.dart' hide Create;
import 'package:rpg_game/model/character.dart';
import 'package:rpg_game/screens/create/create.dart';
import 'package:rpg_game/services/character_store.dart';
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
  void initState() {
    Provider.of<CharacterStore>(context, listen: false).fetchCharactersOnce();

    super.initState();
  }


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
              child: Consumer<CharacterStore> (
                  builder: (context, value, child) {
                    return ListView.builder(
                      itemCount: value.characters.length,
                      itemBuilder: (_, index) {   //这里的_是指不需要用BuildContext context这个参数
                        return CharacterCard(value.characters[index]);
                      },
                    );
                  }
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

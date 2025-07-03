import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rpg_game/model/character.dart';
import 'package:rpg_game/model/vocation.dart';
import 'package:rpg_game/screens/create/vocation_card.dart';
import 'package:rpg_game/screens/home/home.dart';
import 'package:rpg_game/services/character_store.dart';
import 'package:rpg_game/shared/styled_button.dart';
import 'package:rpg_game/shared/styled_text.dart';
import 'package:rpg_game/theme.dart';
import 'package:uuid/uuid.dart';


var uid = const Uuid();

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {

  //通过controller，来获得用户输入的内容，和控制输入框里的内容，也能清空输入框
  final _nameController = TextEditingController();
  final _sloganController = TextEditingController();

  //controller会占用内存，所以需要用dispose来手动释放内存
  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.dispose();
    _sloganController.dispose();
    super.dispose();
  }

  //handle vocation selection
  Vocation selectedVocation = Vocation.archer;

  void updateVocation(Vocation vocation) {
    setState(() {
      selectedVocation = vocation;
    });
  }


  //submit handler
  void handleSumbit() {

    if(_nameController.text.trim().isEmpty && _sloganController.text.trim().isEmpty) {
      showDialog(context: context, builder: (ctx) {
        return AlertDialog(
          title: const StyledHeading('Missing Character Name & slogan'),
          content: const StyledText('To create a new character, please add a name and a slogan'),
          actions: [
            StyledButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              label: 'close',
            )
          ],
          actionsAlignment: MainAxisAlignment.center,
        );
      });
      return;
    }

    //如果用户没有填信息，给出警告
    if(_nameController.text.trim().isEmpty){
      showDialog(context: context, builder: (ctx) {
        return AlertDialog(
          title: const StyledHeading('Missing Character Name'),
          content: const StyledText('You have to give RPG character a name!'),
          actions: [
            StyledButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              label: 'close',
            )
          ],
          actionsAlignment: MainAxisAlignment.center,
        );
      });
      return;   //这里的return直接推出函数，所以不会运行下面的characters.add了
    }

    if(_sloganController.text.trim().isEmpty){
      showDialog(context: context, builder: (ctx) {
        return AlertDialog(
          title: const StyledHeading('Missing Character Slogan'),
          content: const StyledText('You have to give RPG character a slogan!'),
          actions: [
            StyledButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              label: 'close',
            )
          ],
          actionsAlignment: MainAxisAlignment.center,
        );
      });
      return;
    }

    print(_nameController.text);
    print(_sloganController.text);

    // characters.add(Character(
    //   name: _nameController.text.trim(),
    //   slogan: _sloganController.text.trim(),
    //   vocation: selectedVocation,
    //   id: uid.v4()
    // ));

    Provider.of<CharacterStore>(context, listen: false)
    .addCharacter(Character(
        name: _nameController.text.trim(),
        slogan: _sloganController.text.trim(),
        vocation: selectedVocation,
        id: uid.v4()
    ));

    characters.forEach((character) {
      print('ID: ${character.id}, Name: ${character.name}, Vocation: ${character.vocation}, Slogan: ${character.slogan}');
    });

    Navigator.push(context, MaterialPageRoute(
        builder: (ctx) => const Home()
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: StyledTitle('Create Characters'),
          centerTitle: true
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: SingleChildScrollView(    //这个很重要，可以让界面上下滑动
            child: Column(
                children: [
                  Center(
                      child: Icon(Icons.code, color: AppColors.orange)
                  ),
                  const Center(
                      child: StyledHeading('Welcome, new player')
                  ),
                  const Center(
                      child: StyledText('Create a name & slogan for your character')
                  ),
                  const SizedBox(height: 30),

                  //user input field
                  TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.accessibility),
                        label: StyledText('Character name'),
                      )
                  ),
                  SizedBox(height:10),
                  TextField(
                      controller: _sloganController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.spa_rounded),
                        label: StyledText('Character slogan'),
                      )
                  ),
                  const SizedBox(height: 30),

                  const Center(
                      child: StyledHeading('Choose a vocation')
                  ),
                  const Center(
                      child: StyledText('This determines available skills')
                  ),
                  const SizedBox(height: 30),

                  //vocation cards放在这里
                  VocationCard(
                    selected: selectedVocation == Vocation.archer,
                    onTap: updateVocation,
                    vocation: Vocation.archer,
                  ),
                  VocationCard(
                      selected: selectedVocation == Vocation.assassin,
                      onTap: updateVocation,
                      vocation: Vocation.assassin
                  ),
                  VocationCard(
                      selected: selectedVocation == Vocation.witch,
                      onTap: updateVocation,
                      vocation: Vocation.witch
                  ),
                  VocationCard(
                      selected: selectedVocation == Vocation.warrior,
                      onTap: updateVocation,
                      vocation: Vocation.warrior
                  ),
                  VocationCard(
                      selected: selectedVocation == Vocation.paladin,
                      onTap: updateVocation,
                      vocation: Vocation.paladin
                  ),
                  const SizedBox(height: 20),


                  const Center(
                      child: StyledHeading('Have fun')
                  ),
                  const Center(
                      child: StyledText('Enjoy your adventure!')
                  ),
                  const SizedBox(height: 30),

                  Center(
                      child: StyledButton(
                        onPressed: handleSumbit,
                        label: 'Create Character',
                      )
                  )
                ]
            )
        )

      )
    );
  }
}

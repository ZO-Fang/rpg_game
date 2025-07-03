import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rpg_game/screens/create/create.dart';
import 'package:rpg_game/screens/home/home.dart';
import 'package:rpg_game/services/character_store.dart';
import 'package:rpg_game/theme.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(ChangeNotifierProvider(
    create: (context) => CharacterStore(),
    child: MaterialApp(
      theme: primaryTheme,
      home: const Home(),
    ),
  ));
}




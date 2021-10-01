import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flame/flame.dart';

import 'game/star_game.dart';

class StarsApp extends StatelessWidget {
  const StarsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stars',
      theme: ThemeData.dark(),
      home: Scaffold(body: GameWidget(game: StarGame())),
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Flame.device.fullScreen();
  Flame.device.setLandscape();

  runApp(const StarsApp());
}

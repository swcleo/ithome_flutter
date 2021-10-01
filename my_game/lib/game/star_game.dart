import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';

import 'background.dart';
import 'ground.dart';
import 'moster.dart';
import 'star.dart';

class StarGame extends FlameGame with HasDraggableComponents, HasCollidables {
  final double screenWidth = MediaQueryData.fromWindow(window).size.width;
  final double screenHeight = MediaQueryData.fromWindow(window).size.height;

  late Ground ground;

  static const _assetsImages = [
    'purple_moster.png',
    'background.jpg',
    'ground.png',
    'star.png'
  ];

  @override
  Future<void> onLoad() async {
    await images.loadAll(_assetsImages);

    final knobPaint = BasicPalette.blue.withAlpha(200).paint();
    final backgroundPaint = BasicPalette.blue.withAlpha(100).paint();

    final joystick = JoystickComponent(
      knob: Circle(radius: 15).toComponent(paint: knobPaint),
      background: Circle(radius: 50).toComponent(paint: backgroundPaint),
      margin: const EdgeInsets.only(left: 30, bottom: 40),
    );

    final background = Background(this);
    ground = Ground(this);

    add(joystick);

    final moster = Moster(this, joystick);
    final star = Star(this);

    add(ScreenCollidable());

    addAll([background, ground, moster, star]);
  }
}

// ignore_for_file: avoid_print

import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/geometry.dart';

import 'moster.dart';

class Star extends SpriteComponent with Hitbox, Collidable {
  final Random _rnd = Random();
  bool _collision = false;
  Star(_game)
      : super(
          sprite: Sprite(_game.images.fromCache('star.png')),
        ) {
    position = getNewStarPosition();
    addHitbox(HitboxCircle());
  }

  Vector2 getNewStarPosition() {
    return Vector2(_rnd.nextDouble() * 800, _rnd.nextDouble() * 100 + 150);
  }

  @override
  void update(double dt) {
    if (_collision) {
      position = getNewStarPosition();
      _collision = false;
    }
    super.update(dt);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, Collidable other) {
    super.onCollision(intersectionPoints, other);
    if (other is Moster) {}
    _collision = true;
  }
}

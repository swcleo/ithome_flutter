import 'package:flame/components.dart';
import 'star_game.dart';

class Ground extends SpriteComponent {
  final double _height = 100;
  final StarGame _game;
  Ground(this._game)
      : super(sprite: Sprite(_game.images.fromCache('ground.png'))) {
    size = Vector2(_game.screenWidth, _height);
    position = Vector2(0, _game.screenHeight - _height);
  }
}

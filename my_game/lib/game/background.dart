import 'package:flame/components.dart';
import 'star_game.dart';

class Background extends SpriteComponent {
  Background(StarGame _game)
      : super(
          sprite: Sprite(
            _game.images.fromCache('background.jpg'),
          ),
          size: Vector2(_game.screenWidth, _game.screenHeight),
        );
}

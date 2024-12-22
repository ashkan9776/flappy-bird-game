import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/game.dart';

class Ground extends SpriteComponent
    with HasGameRef<FlappyBirdGame>, CollisionCallbacks {
  Ground() : super();

  @override
  Future<void> onLoad() async {
    size = Vector2(2 * gameRef.size.x, 200);
    position = Vector2(0, gameRef.size.y - groundHeight);

    sprite = await Sprite.load('ground.png');

    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    position.x -= groundScrollungSpeed * dt;
    if (position.x + size.x / 2 <= 0) {
      position.x = 0;
    }
  }
}

import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter_application_1/components/ground.dart';
import 'package:flutter_application_1/components/pipe.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/game.dart';

class Bird extends SpriteComponent with CollisionCallbacks {
  Bird()
      : super(
          position: Vector2(birdStartX, birdStartY),
          size: Vector2(birdWidth, birdHeight),
        );
  double velocity = 0;

  @override
  FutureOr<void> onLoad() async {
    sprite = await Sprite.load('bird.png');

    add(RectangleHitbox());
  }

  void flap() {
    velocity = jump;
  }

  @override
  void update(double dt) {
    velocity += gravity * dt;
    position.y += velocity * dt;
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);

    if (other is Ground) {
      (parent as FlappyBirdGame).gameOver();
    }
    if (other is Pipe) {
      (parent as FlappyBirdGame).gameOver();
    }
  }
}

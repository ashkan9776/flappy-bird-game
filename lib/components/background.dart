import 'dart:async';

import 'package:flame/components.dart';

class Background extends SpriteComponent {
  Background(Vector2 size)
      : super(
          size: size,
          position: Vector2.zero(),
        );

        @override
  FutureOr<void> onLoad() async {
          sprite = await Sprite.load('background.png');
        }
}

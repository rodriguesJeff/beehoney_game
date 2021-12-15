import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(
    GameWidget(game: BeeHoney()),
  );
}

class BeeHoney extends FlameGame {
  SpriteComponent bg = SpriteComponent();
  SpriteComponent bee = SpriteComponent();

  @override
  Future<void>? onLoad() async {
    bg
      ..sprite = await Sprite.load("bg.png")
      ..size.x = 500
      ..size.y = 900
      ..position = Vector2(0, 0);

    add(bg);

    bee
      ..sprite = await Sprite.load("bee1.png")
      ..size = Vector2.all(50)
      ..position = Vector2(250, 800);

    add(bee);
    return super.onLoad();
  }
}

import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/sprite.dart';

class Obj extends SpriteComponent with HasHitboxes, Collidable {
  int timer = 0;
  int img = 1;
  String name = "";

  animation(time, spriteLimit, name) async {
    timer++;
    if (timer > time) {
      timer = 1;
      img++;
    }

    if (img > spriteLimit) {
      img = 1;
    }
    sprite = await Sprite.load("$name$img.png");
  }

  random(min, max) {
    var r = Random();
    return min + r.nextInt(max - min);
  }
}

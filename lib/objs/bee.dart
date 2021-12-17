import 'package:beehoney_game/game/utils/utils.dart';
import 'package:beehoney_game/objs/flower.dart';
import 'package:beehoney_game/objs/obj.dart';
import 'package:beehoney_game/objs/spider.dart';
import 'package:flame/components.dart';

class Bee extends Obj {
  bool right = false;
  bool left = false;

  move(dt, speed) {
    if (right) {
      if (x <= 475) {
        x += speed;
      }
    }
    if (left) {
      if (x >= 25) {
        x -= speed;
      }
    }
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, Collidable other) {
    super.onCollision(intersectionPoints, other);

    if (other is Spider) {
      other.position.y = -100;
      lifes--;
    }
    if (other is Flower) {
      other.position.y = -100;
      other.position.x = random(50, 500);
      score++;
    }
  }
}

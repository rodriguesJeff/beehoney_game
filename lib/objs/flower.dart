import 'package:beehoney_game/objs/obj.dart';

class Flower extends Obj {
  move(dt, speed) {
    y += speed * dt;

    if (y > 950) {
      y = -50;
      x = random(50, 500);
    }
  }
}

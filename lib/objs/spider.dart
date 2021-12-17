import 'package:beehoney_game/objs/obj.dart';

class Spider extends Obj {
  move(dt, bee) {
    y += 80 * dt;
    if (y > 950) {
      y = -50;
    }

    if (x < bee.x) {
      x += 2;
    }
    if (x > bee.x) {
      x -= 2;
    }
  }
}

import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/geometry.dart';
import 'package:flame/input.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(
    GameWidget(game: BeeHoney()),
  );
}

class BeeHoney extends FlameGame with KeyboardEvents, HasCollidables {
  Bg bg = Bg();
  Bg bg2 = Bg();
  Bee bee = Bee();
  Spider spider = Spider();
  Flower flower = Flower();

  @override
  Future<void>? onLoad() async {
    bg
      ..sprite = await Sprite.load("bg.png")
      ..size.x = 500
      ..size.y = 900
      ..position = Vector2(0, 0);

    add(bg);

    bg2
      ..sprite = await Sprite.load("bg.png")
      ..size.x = 500
      ..size.y = 900
      ..position = Vector2(0, -900);

    add(bg2);

    bee
      ..sprite = await Sprite.load("bee1.png")
      ..size = Vector2.all(50)
      ..position = Vector2(250, 800)
      ..anchor = Anchor.center
      ..addHitbox(HitboxRectangle());

    add(bee);

    spider
      ..sprite = await Sprite.load("spider1.png")
      ..size = Vector2.all(80)
      ..position = Vector2(250, 500)
      ..anchor = Anchor.center
      ..addHitbox(HitboxRectangle());

    add(spider);

    flower
      ..sprite = await Sprite.load("florwer1.png")
      ..size = Vector2.all(30)
      ..position = Vector2(200, 400)
      ..anchor = Anchor.center
      ..addHitbox(HitboxRectangle());

    add(flower);

    return super.onLoad();
  }

  @override
  void update(double dt) {
    bg.move(dt, 100, 900, 0);
    bg2.move(dt, 100, 0, -900);

    bee.move(dt, 10);
    bee.animation(8, 4, "bee");

    spider.animation(8, 4, "spider");
    spider.move(dt, bee);

    flower.move(dt, 200);
    flower.animation(8, 2, "florwer");
    super.update(dt);
  }

  @override
  KeyEventResult onKeyEvent(
      RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    if (event.data.keyLabel == "a") {
      bee.left = true;
    } else {
      bee.left = false;
    }
    if (event.data.keyLabel == "d") {
      bee.right = true;
    } else {
      bee.right = false;
    }
    return super.onKeyEvent(event, keysPressed);
  }
}

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

class Bg extends SpriteComponent {
  move(dt, speed, limit, posy) {
    y += speed * dt;

    if (y >= limit) {
      y = posy;
    }
  }
}

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
    }
    if (other is Flower) {
      other.position.y = -100;
      other.position.x = random(50, 500);
    }
  }
}

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

class Flower extends Obj {
  move(dt, speed) {
    y += speed * dt;

    if (y > 950) {
      y = -50;
      x = random(50, 500);
    }
  }
}

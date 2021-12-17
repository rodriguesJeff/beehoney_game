import 'package:beehoney_game/game/beehoney.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GameWidget(
                game: BeeHoney(),
              ),
            ),
          );
        },
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            "assets/images/start.png",
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}

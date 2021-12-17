import 'package:beehoney_game/app/screens/main_screen/main_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const Main(),
  );
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainScreen(),
    );
  }
}

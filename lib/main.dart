import 'package:flutter/material.dart';
import 'package:score_keeper/screens/game_screen.dart';

void main() {
  runApp(const ScoreBoardApp());
}

class ScoreBoardApp extends StatelessWidget {
  const ScoreBoardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Score Keeper',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const GameScreen(),
    );
  }
}

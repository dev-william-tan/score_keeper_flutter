import 'package:flutter/material.dart';
import 'package:score_keeper/widgets/badminton_score_board.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: ScoreBoard(),
      )
    );
  }
}
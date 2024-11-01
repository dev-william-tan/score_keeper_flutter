import 'package:flutter/material.dart';
import 'package:score_keeper/models/game_type.dart';
import 'package:score_keeper/widgets/score_board.dart';

class GameScreen extends StatelessWidget {
  final GameType gameType;
  const GameScreen({super.key, required this.gameType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ModernScoreboard(gameType: gameType),
      )
    );
  }
}
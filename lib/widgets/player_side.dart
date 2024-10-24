import 'package:flutter/material.dart';

class PlayerSide extends StatelessWidget {
  final int score;
  final VoidCallback onTap;
  final String playerName;
  final Color backgroundColor;

  const PlayerSide({
    super.key,
    required this.score,
    required this.onTap,
    required this.playerName,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              playerName,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              score.toString(),
              style: const TextStyle(
                fontSize: 72,
                fontWeight: FontWeight.bold,
              ),
            ),
          ]
        )
      )
    );
  }
}
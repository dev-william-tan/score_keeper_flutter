import 'package:flutter/material.dart';

class WinnerDialog extends StatelessWidget {
  final String winner;
  final VoidCallback onNewGame;

  const WinnerDialog({
    super.key,
    required this.winner,
    required this.onNewGame,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Congratulations!'),
      content: Column(mainAxisSize: MainAxisSize.min, children: [
        const Icon(
          Icons.emoji_events,
          size: 50,
          color: Colors.amber,
        ),
        const SizedBox(height: 16),
        Text(
          '$winner Wins!',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ]),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
        ElevatedButton(
          onPressed: () {
            onNewGame();
            Navigator.of(context).pop();
          },
          child: const Text('New Game'),
        ),
      ],
    );
  }
}

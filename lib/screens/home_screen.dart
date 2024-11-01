import 'package:flutter/material.dart';
import 'package:score_keeper/models/game_type.dart';
import 'package:score_keeper/screens/game_screen.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Score Keeper'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _SportButton(
                sport: 'Badminton',
                icon: Icons.sports_tennis,
                onTap: () => _navigateToGame(context, GameType.badminton),
              ),
              const SizedBox(height: 16),
              _SportButton(
                sport: 'Basketball',
                icon: Icons.sports_basketball,
                onTap: () => _navigateToGame(context, GameType.basketball),
              ),
              const SizedBox(height: 16),
            ]
          )
        ),
      )
    );
  }

  void _navigateToGame(BuildContext context, GameType gameType) {
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context) => GameScreen(gameType: gameType),)
      );
  }

}

  class _SportButton extends StatelessWidget {
    final String sport;
    final IconData icon;
    final VoidCallback onTap;

    const _SportButton({
      required this.sport,
      required this.icon,
      required this.onTap,
    });


    @override
    Widget build(BuildContext context) {
      return SizedBox(
        width: 200,
        height: 60,
        child: ElevatedButton.icon(
          onPressed: onTap,
          icon: Icon(icon),
          label: Text(sport),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Theme.of(context).primaryColor,
          ),
        ),
      );
    }
  }
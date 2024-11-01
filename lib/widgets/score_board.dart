import 'package:flutter/material.dart';
import 'package:score_keeper/models/game_rules.dart';
import 'package:score_keeper/models/game_type.dart';
import 'package:score_keeper/widgets/winner_dialog.dart';

class ModernScoreboard extends StatefulWidget {
  final GameType gameType;

  const ModernScoreboard({super.key, required this.gameType});

  @override
  State<ModernScoreboard> createState() => _ModernScoreboardState();
}

class _ModernScoreboardState extends State<ModernScoreboard> {
  int team1Score = 0;
  int team2Score = 0;
  bool isGameOver = false;
  String winner = "";

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Navigation Rail
        Container(
          width: 60,
          color: Colors.grey[200],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  IconButton(
                    icon: const Icon(Icons.settings),
                    onPressed: () {
                      // TODO: Implement settings
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.refresh),
                    onPressed: _resetScore,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
        ),
        // Main content
        Expanded(
          child: Row(
            children: [
              // Team 1
              Expanded(
                child: _TeamScoreSection(
                  teamName: 'Team 1',
                  score: team1Score,
                  color: Colors.red,
                  onIncrement: () => _updateScore(1, 1),
                  onDecrement: () => _updateScore(1, -1),
                ),
              ),
              // Divider
              Container(
                width: 2,
                color: Colors.grey[300],
              ),
              // Team 2
              Expanded(
                child: _TeamScoreSection(
                  teamName: 'Team 2',
                  score: team2Score,
                  color: Colors.blue,
                  onIncrement: () => _updateScore(2, 1),
                  onDecrement: () => _updateScore(2, -1),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _updateScore(int team, int change) {
    setState(() {
      if (team == 1) {
        team1Score = (team1Score + change).clamp(0, 999);
      } else {
        team2Score = (team2Score + change).clamp(0, 999);
      }
      checkWinCondition();
    });
  }

  void checkWinCondition() {
    if (isGameOver) {
      return;
    }

    final rules = GameRules.rules[widget.gameType]!;

    if (widget.gameType == GameType.badminton) {
      if (team1Score >= 21 || team2Score >= 21) {
        if (team1Score >= rules.maxScore ||
            (team1Score >= 21 && team1Score - team2Score >= 2)) {
          setState(() {
            isGameOver = true;
            winner = "Team 1";
            _showWinnerDialog();
          });
        } else if (team2Score >= rules.maxScore ||
            (team2Score >= 21 && team2Score - team1Score >= 2)) {
          isGameOver = true;
          winner = "Team 2";
          _showWinnerDialog();
        }
      }
    }
  }

  void _resetScore() {
    setState(() {
      team1Score = 0;
      team2Score = 0;
    });
  }

  void _showWinnerDialog() {
    if (!isGameOver) return;

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => WinnerDialog(
          winner: winner,
          onNewGame: () {
            _resetScore();
          },
        ),
      );
  }
}

class _TeamScoreSection extends StatelessWidget {
  final String teamName;
  final int score;
  final Color color;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const _TeamScoreSection({
    required this.teamName,
    required this.score,
    required this.color,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          teamName,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(color: color, width: 3),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              score.toString(),
              style: const TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _ScoreButton(
              onPressed: onDecrement,
              icon: Icons.remove,
            ),
            const SizedBox(width: 16),
            _ScoreButton(
              onPressed: onIncrement,
              icon: Icons.add,
            ),
          ],
        ),
      ],
    );
  }
}

class _ScoreButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;

  const _ScoreButton({
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(4),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon),
        iconSize: 24,
      ),
    );
  }
}

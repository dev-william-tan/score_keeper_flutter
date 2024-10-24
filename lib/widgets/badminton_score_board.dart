import 'package:flutter/material.dart';
import 'package:score_keeper/widgets/player_side.dart';

class ScoreBoard extends StatefulWidget {
  const ScoreBoard({super.key});

  @override
  State<ScoreBoard> createState() => _ScoreBoardState();
 
}

class _ScoreBoardState extends State<ScoreBoard> {
  int player1Score = 0;
  int player2Score = 0;
  bool gameEnded = false; 

  void incrementScore(int playerNumber) {
    if (gameEnded) return;

    setState(() {
      if (playerNumber == 1) {
        player1Score++;
      } else {
        player2Score++;
      }

      checkGameEnd();
    });
  }


  void checkGameEnd() {
    if (player1Score >= 21 && player1Score - player2Score >= 2){
      gameEnded = true;
      showWinnerDialog("Player 1");
    } else if (player2Score >= 21 && player2Score - player1Score >= 2) {
      gameEnded = true;
      showWinnerDialog("Player 2");
    }
  }

  void resetGame() {
    setState(() {
      player1Score = 0;
      player2Score = 0;
      gameEnded = false; 
    });
  }

  void showWinnerDialog(String winner) {
    showDialog(
      context: context,
      barrierDismissible: false, 
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Game Over!'),
          content: Text('$winner wins!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                resetGame();
              },
              child: const Text('New Game'),
            ),
          ],
        );
      },
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: PlayerSide(
            score: player1Score,
            onTap: () => incrementScore(1),
            playerName: "Player 1",
            backgroundColor: Colors.blue.shade100,
          ),
        ),
        Container(
          width: 2, 
          color: Colors.black,
        ),
        Expanded(
          child: PlayerSide(
            score: player2Score,
            onTap: () => incrementScore(2),
            playerName: "Player 2",
            backgroundColor: Colors.red.shade100,
          ),
        ),
      ],
    );
  }

}
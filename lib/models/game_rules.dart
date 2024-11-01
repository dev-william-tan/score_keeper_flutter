import 'package:score_keeper/models/game_type.dart';

class GameRules {
  final int maxScore;
  final bool requiresTwoPointLead;
  final int? twoPointLeadThreshold;

  const GameRules({
    required this.maxScore,
    this.requiresTwoPointLead = false,
    this.twoPointLeadThreshold,
  });

  static Map<GameType, GameRules> rules = {
    GameType.badminton: const GameRules(
      maxScore: 30, 
      requiresTwoPointLead: true, 
      twoPointLeadThreshold: 20),
    GameType.basketball: const GameRules(
      maxScore: 999),
  };

}

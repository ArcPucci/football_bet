import 'package:football_bet/services/services.dart';
import 'models.dart';

enum SportType { soccer, basketball, football }

class Event {
  final int id;
  final TeamModel firstTeam;
  final TeamModel secondTeam;
  int firstTeamScore;
  int secondTeamScore;
  final SportType sportType;
  final double odd1;
  final double odd2;
  final double odd3;
  final String description;
  final DateTime startTime;
  int ownerBet;
  bool? win;

  Event({
    required this.id,
    required this.firstTeam,
    required this.secondTeam,
    required this.firstTeamScore,
    required this.secondTeamScore,
    required this.sportType,
    required this.odd1,
    required this.odd2,
    required this.odd3,
    required this.description,
    required this.startTime,
    this.ownerBet = 0,
    this.win,
  });

  Duration get remaining => startTime.difference(DateTime.now());

  int get days => remaining.inDays;

  int get hours => remaining.inHours % 24;

  int get minutes => remaining.inMinutes % 60 + 1;

  bool get isOver => startTime.isBefore(DateTime.now());

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'first_team': firstTeam.toString(),
      'second_team': secondTeam.toString(),
      'first_team_score': firstTeamScore,
      'second_team_score': secondTeamScore,
      'sport_type': sportsId[sportType],
      'odd1': odd1,
      'odd2': odd2,
      'odd3': odd3,
      'description': description,
      'start_time': startTime.microsecondsSinceEpoch,
      'owner_bet': ownerBet,
      'win': win == null
          ? -1
          : win!
          ? 1
          : 0,
    };
  }

  factory Event.fromMap(Map<String, dynamic> map) {
    final team1 = map['first_team'] as String;
    final team2 = map['second_team'] as String;

    return Event(
      id: map['id'] as int,
      firstTeam: TeamModel.fromString(team1),
      secondTeam: TeamModel.fromString(team2),
      firstTeamScore: map['first_team_score'] as int,
      secondTeamScore: map['second_team_score'] as int,
      sportType: sportsName[map['sport_type'] as int]!,
      odd1: double.parse(map['odd1'] as String),
      odd2: double.parse(map['odd2'] as String),
      odd3: double.parse(map['odd3'] as String),
      description: map['description'] as String,
      startTime: DateTime.fromMicrosecondsSinceEpoch(map['start_time'] as int),
      ownerBet: map['owner_bet'] as int,
      win: (map['win'] as int?) == -1 ? null : map['win'] == 1,
    );
  }

  Event copyWith({
    int? id,
    TeamModel? firstTeam,
    TeamModel? secondTeam,
    int? firstTeamScore,
    int? secondTeamScore,
    SportType? sportType,
    double? odd1,
    double? odd2,
    double? odd3,
    String? description,
    DateTime? startTime,
    int? ownerBet,
    bool? win,
  }) {
    return Event(
      id: id ?? this.id,
      firstTeam: firstTeam ?? this.firstTeam,
      secondTeam: secondTeam ?? this.secondTeam,
      firstTeamScore: firstTeamScore ?? this.firstTeamScore,
      secondTeamScore: secondTeamScore ?? this.secondTeamScore,
      sportType: sportType ?? this.sportType,
      odd1: odd1 ?? this.odd1,
      odd2: odd2 ?? this.odd2,
      odd3: odd3 ?? this.odd3,
      description: description ?? this.description,
      startTime: startTime ?? this.startTime,
      ownerBet: ownerBet ?? this.ownerBet,
      win: win ?? this.win,
    );
  }
}

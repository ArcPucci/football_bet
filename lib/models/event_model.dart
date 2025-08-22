import 'models.dart';

enum SportType { soccer, basketball, football }

class EventModel {
  final int id;
  final TeamModel firstTeam;
  final TeamModel secondTeam;
  final int firstTeamScore;
  final int secondTeamScore;
  final SportType sportType;
  final double odd1;
  final double odd2;
  final double odd3;
  final String description;
  final DateTime startDate;
  final bool? win;

  EventModel({
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
    required this.startDate,
    this.win,
  });
}

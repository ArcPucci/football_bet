import 'models.dart';

class LeagueModel {
  final int id;
  final String name;
  final String asset;
  final List<TeamModel> teams;

  LeagueModel({
    required this.id,
    required this.name,
    required this.asset,
    required this.teams,
  });
}

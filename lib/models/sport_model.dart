import 'package:football_bet/models/event.dart';

class SportModel {
  final int id;
  final SportType sportType;
  final String logo;
  final String name;

  SportModel({
    required this.id,
    required this.sportType,
    required this.logo,
    required this.name,
  });
}

import 'package:football_bet/models/models.dart';

class TeamModel {
  final int id;
  final bool customTeam;
  final SportType sportType;
  final String name;
  final String logo;
  final int rating;

  TeamModel({
    required this.id,
    this.customTeam = false,
    required this.sportType,
    required this.name,
    required this.logo,
    required this.rating,
  });

  bool get logoFromAsset => logo.startsWith('assets/png/');

  Map<String, dynamic> toMap() {
    final int sportId = switch (sportType) {
      SportType.soccer => 0,
      SportType.football => 1,
      SportType.basketball => 2,
    };

    return {
      'id': id,
      'sport_type': sportId,
      'custom_team': customTeam ? 1 : 0,
      'name': name,
      'logo': logo,
      'rating': rating,
    };
  }

  factory TeamModel.fromMap(Map<String, dynamic> map) {
    final int sportType = map['sport_type'] as int;

    final sport = switch (sportType) {
      0 => SportType.soccer,
      1 => SportType.football,
      2 => SportType.basketball,
      _ => SportType.soccer,
    };

    return TeamModel(
      id: map['id'] as int,
      sportType: sport,
      customTeam: map['custom_team'] == 1,
      name: map['name'] as String,
      logo: map['logo'] as String,
      rating: map['rating'] as int,
    );
  }

  SportType getSportType(int value) => switch (value) {
    0 => SportType.soccer,
    1 => SportType.football,
    2 => SportType.basketball,
    _ => SportType.soccer,
  };

  TeamModel copyWith({
    int? id,
    bool? customTeam,
    SportType? sportType,
    String? name,
    String? logo,
    int? rating,
  }) {
    return TeamModel(
      id: id ?? this.id,
      customTeam: customTeam ?? this.customTeam,
      sportType: sportType ?? this.sportType,
      name: name ?? this.name,
      logo: logo ?? this.logo,
      rating: rating ?? this.rating,
    );
  }
}

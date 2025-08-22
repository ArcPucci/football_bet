import 'package:football_bet/models/models.dart';
import 'package:football_bet/services/services.dart';
import 'package:football_bet/utils/utils.dart';

class NotificationModel {
  final int id;
  final SportType sportType;
  final String firstTeam;
  final String secondTeam;
  final int remainingTime;
  final bool seen;

  NotificationModel({
    required this.id,
    required this.sportType,
    required this.firstTeam,
    required this.secondTeam,
    required this.remainingTime,
    this.seen = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'sport_type': sportsId[sportType],
      'first_team': firstTeam,
      'second_team': secondTeam,
      'remaining_time': remainingTime,
      'seen': seen ? 1 : 0,
    };
  }

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      id: map['id'] as int,
      sportType: sportModels
          .firstWhere((e) => e.id == map['sport_type'] as int)
          .sportType,
      firstTeam: map['first_team'] as String,
      secondTeam: map['second_team'] as String,
      remainingTime: map['remaining_time'] as int,
      seen: (map['seen'] as int) == 1,
    );
  }

  NotificationModel copyWith({
    int? id,
    SportType? sportType,
    String? firstTeam,
    String? secondTeam,
    int? remainingTime,
    bool? seen,
  }) {
    return NotificationModel(
      id: id ?? this.id,
      sportType: sportType ?? this.sportType,
      firstTeam: firstTeam ?? this.firstTeam,
      secondTeam: secondTeam ?? this.secondTeam,
      remainingTime: remainingTime ?? this.remainingTime,
      seen: seen ?? this.seen,
    );
  }
}

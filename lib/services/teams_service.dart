import 'dart:io';

import 'package:football_bet/models/models.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

const teamsTable = "TEAMS_TABLE";

var sportsId = {
  SportType.soccer: 0,
  SportType.football: 1,
  SportType.basketball: 2,
};

class TeamsService {
  final Database _database;

  TeamsService(this._database);

  Future<void> createTeam(TeamModel team) async {
    var map = team.toMap();

    if (!team.logoFromAsset) {
      final copiedPath = await _copyLogoToAppDir(team.logo);
      map['logo'] = copiedPath;
    }

    map['id'] = null;
    await _database.insert(teamsTable, map);
  }

  Future<String> _copyLogoToAppDir(String sourcePath) async {
    final File sourceFile = File(sourcePath);

    if (!(await sourceFile.exists())) {
      return sourcePath;
    }

    final Directory appDir = await getApplicationDocumentsDirectory();
    final String ext = sourcePath.split('.').last;
    final String fileName = 'team_${DateTime.now().millisecondsSinceEpoch}.$ext';
    final String newPath = '${appDir.path}/$fileName';

    final File newFile = await sourceFile.copy(newPath);
    return newFile.path;
  }
  Future<List<TeamModel>> getTeams(SportType sportType) async {
    final sportId = sportsId[sportType];
    final map = await _database.query(
      teamsTable,
      where: 'sport_type = ?',
      whereArgs: [sportId],
    );
    if (map.isEmpty) return [];

    return map.map(TeamModel.fromMap).toList();
  }
}

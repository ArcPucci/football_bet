import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:football_bet/models/models.dart';
import 'package:sqflite/sqflite.dart';

const playersTable = 'PLAYERS_TABLE';

class PlayersService {
  final Database _database;

  PlayersService(this._database);

  Future<void> createPlayer(Player player) async {
    final map = player.toMap();

    if (!player.photoFromAsset) {
      final copiedPath = await _copyPhotoToAppDir(player.photo);
      map['photo'] = copiedPath;
    }

    map['id'] = null;
    await _database.insert(playersTable, map);
  }

  Future<String> _copyPhotoToAppDir(String sourcePath) async {
    final File sourceFile = File(sourcePath);

    if (!(await sourceFile.exists())) {
      return sourcePath;
    }

    final Directory appDir = await getApplicationDocumentsDirectory();

    final String ext = sourcePath.split('.').last;
    final String fileName =
        'player_${DateTime.now().millisecondsSinceEpoch}.$ext';

    final String newPath = '${appDir.path}/$fileName';

    final File newFile = await sourceFile.copy(newPath);
    return newFile.path;
  }

  Future<void> updatePlayer(Player player) async {
    final map = player.toMap();
    await _database.update(
      playersTable,
      map,
      where: 'id = ?',
      whereArgs: [player.id],
    );
  }

  Future<List<Player>> getPlayers(int eventId) async {
    final map = await _database.query(
      playersTable,
      where: 'event_id = ?',
      whereArgs: [eventId],
    );

    if (map.isEmpty) return [];
    return map.map(Player.fromMap).toList();
  }
}

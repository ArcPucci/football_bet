import 'package:sqflite/sqflite.dart';

import '../models/models.dart';

const String notificationsTable = 'NOTIFICATIONS_TABLE';

class NotificationService {
  final Database _database;

  NotificationService(this._database);

  Future<void> createNotification(NotificationModel notification) async {
    final map = notification.toMap();
    map['id'] = null;

    await _database.insert(notificationsTable, map);
  }

  Future<void> updateNotification(NotificationModel notification) async {
    final map = notification.toMap();
    await _database.update(
      notificationsTable,
      map,
      where: 'id = ?',
      whereArgs: [notification.id],
    );
  }

  Future<List<NotificationModel>> getSeenNotifications() async {
    final list = await _database.query(
      notificationsTable,
      where: 'seen = ?',
      whereArgs: [1],
    );

    if (list.isEmpty) return [];

    return list.map(NotificationModel.fromMap).toList();
  }

  Future<List<NotificationModel>> getUnseenNotifications() async {
    final list = await _database.query(
      notificationsTable,
      where: 'seen = ?',
      whereArgs: [0],
    );

    if (list.isEmpty) return [];

    return list.map(NotificationModel.fromMap).toList();
  }

  Future<void> clearAll() async {
    await _database.delete(notificationsTable);
  }
}

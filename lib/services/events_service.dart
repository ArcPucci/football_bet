import 'package:football_bet/services/services.dart';
import 'package:sqflite/sqflite.dart';

import '../models/models.dart';

const eventsTable = 'EVENTS_TABLE';

class EventsService {
  final Database _database;

  EventsService(this._database);

  Future<int> createEvent(Event event) async {
    final map = event.toMap();
    map['id'] = null;
    return await _database.insert(eventsTable, map);
  }

  Future<Event?> getEventById(int id) async {
    final map = await _database.query(
      eventsTable,
      where: 'id = ?',
      whereArgs: [id],
    );

    if(map.isEmpty) return null;

    return Event.fromMap(map.first);
  }

  Future<List<Event>> getActiveEvents() async {
    final map = await _database.query(
      eventsTable,
      where: 'win = ?',
      whereArgs: [-1],
    );

    if (map.isEmpty) return [];

    return map.map(Event.fromMap).toList();
  }

  Future<List<Event>> getInactiveEventsBySportType(int sportType) async {
    final map = await _database.query(
      eventsTable,
      where: 'sport_type = ? AND win != ?',
      whereArgs: [sportType, -1],
    );

    if (map.isEmpty) return [];

    return map.map(Event.fromMap).toList();
  }

  Future<List<Event>> getInactiveEvents() async {
    final map = await _database.query(
      eventsTable,
      where: 'win != ?',
      whereArgs: [-1],
    );

    if (map.isEmpty) return [];

    return map.map(Event.fromMap).toList();
  }

  Future<List<Event>> getAllEvents() async {
    final map = await _database.query(eventsTable);
    if (map.isEmpty) return [];

    return map.map(Event.fromMap).toList();
  }

  Future<void> updateEvent(Event event) async {
    await _database.update(
      eventsTable,
      event.toMap(),
      where: 'id = ?',
      whereArgs: [event.id],
    );
  }

  Future<List<Event>> getEventsBySportType(SportType sportType) async {
    final map = await _database.query(
      eventsTable,
      where: 'sport_type = ?',
      whereArgs: [sportsId[sportType]],
    );

    if (map.isEmpty) return [];

    return map.map(Event.fromMap).toList();
  }
}

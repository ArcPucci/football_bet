import 'package:flutter/material.dart';
import 'package:football_bet/models/models.dart';
import 'package:football_bet/services/services.dart';
import 'package:football_bet/utils/utils.dart';
import 'package:go_router/go_router.dart';

class LeaderboardProvider extends ChangeNotifier {
  final EventsService _eventsService;
  final GoRouter _router;
  final int? eventId;

  LeaderboardProvider({
    required EventsService eventsService,
    required GoRouter router,
    this.eventId,
  }) : _eventsService = eventsService,
       _router = router {
    initEvents();
  }

  SportModel _sportModel = sportModels.first;

  SportModel get sportModel => _sportModel;

  List<Event> _events = [];

  List<Event> get events => _events;

  Event? _event = null;

  Event get event => _event!;

  List<Player> _players = [];

  List<Player> get players => _players;

  void initEvents() async {
    print('object');
    print(_sportModel.id);
    _events = await _eventsService.getInactiveEventsBySportType(_sportModel.id);
    notifyListeners();
  }

  void getEvent() async {
    if (eventId == null) return;
    _event = await _eventsService.getEventById(eventId!);
    notifyListeners();
  }

  void changeSport(SportModel sportModel) {
    _sportModel = sportModel;
    initEvents();

    notifyListeners();
  }

  void selectEvent(Event event) {
    _event = event;
    _router.go('/chart/review');
  }
}

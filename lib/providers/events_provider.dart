import 'dart:async';

import 'package:flutter/material.dart';
import 'package:football_bet/models/models.dart';
import 'package:football_bet/providers/providers.dart';
import 'package:football_bet/services/services.dart';
import 'package:go_router/go_router.dart';

class EventsProvider extends ChangeNotifier {
  final ProfileProvider _profileProvider;
  final EventsService _eventsService;
  final PlayersService _playersService;
  final LeaderboardProvider _leaderboardProvider;
  final GoRouter _router;

  List<Event> _inactiveEvents = [];

  List<Event> get inactiveEvents => _inactiveEvents;

  final List<EventModel> _activeEvents = [];

  List<EventModel> get events => _activeEvents;

  Event? _eventModel;

  Event? get eventModel => _eventModel;

  Player get player => Player(
    id: -1,
    eventId: _eventModel!.id,
    name: '${_profileProvider.name} ${_profileProvider.surname}',
    photo: _profileProvider.profilePhoto ?? '',
    firstParticipantWins: _eventModel!.ownerBet,
  );

  List<Player> _players = [];

  EventsProvider({
    required ProfileProvider profileProvider,
    required EventsService eventsService,
    required PlayersService playersService,
    required LeaderboardProvider leaderboardProvider,
    required GoRouter router,
  }) : _profileProvider = profileProvider,
       _eventsService = eventsService,
       _playersService = playersService,
       _leaderboardProvider = leaderboardProvider,
       _router = router {
    _initActiveEvents();
    _initInactiveEvents();
  }

  List<Player> get players => _players;

  void _initInactiveEvents() async {
    _inactiveEvents = await _eventsService.getInactiveEvents();
    notifyListeners();
  }

  void _initActiveEvents() async {
    final list = await _eventsService.getActiveEvents();
    _activeEvents.clear();

    for (var event in list) {
      if (event.win == null) {
        if (event.startTime.isAfter(DateTime.now())) {
          _activeEvents.add(
            EventModel(
              event: event,
              timer: Timer.periodic(Duration(minutes: 1), (timer) {
                notifyListeners();
                if (event.startTime.difference(DateTime.now()).inMinutes + 1 <=
                    0) {
                  timer.cancel();
                  return;
                }
              }),
            ),
          );
        } else {
          _activeEvents.add(EventModel(event: event));
        }
      }
    }

    notifyListeners();
  }

  void selectEvent(Event eventModel) async {
    _eventModel = eventModel;
    _players = await _playersService.getPlayers(eventModel.id);

    notifyListeners();

    _router.go('/details');
  }

  void updatePlayerBet(int playerIndex, int index) {
    if (_eventModel!.isOver) return;
    _players[playerIndex].firstParticipantWins = index;
    notifyListeners();
  }

  void changeBet(int index) {
    if (_eventModel!.isOver) return;
    _eventModel!.ownerBet = index;
    notifyListeners();
  }

  void createEvent(Event eventModel, List<PlayerModel> players) async {
    try {
      final id = await _eventsService.createEvent(eventModel);
      addPlayers(id, players);
      print(players.length);

      _initActiveEvents();
      _initInactiveEvents();

      _eventModel = eventModel.copyWith(id: id);
      _router.go('/events/details');
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateEvent() async {
    await _eventsService.updateEvent(_eventModel!);
  }

  void updatePlayer(int index) async {
    await _playersService.updatePlayer(_players[index]);
  }

  void completeEvent(int score1, int score2) async {
    final result = score1 > score2
        ? 0
        : score1 < score2
        ? 1
        : 2;
    _eventModel!.win = _eventModel!.ownerBet == result;
    _eventModel!.firstTeamScore = score1;
    _eventModel!.secondTeamScore = score2;
    _profileProvider.addBet(_eventModel!.sportType);

    await updateEvent();
    _leaderboardProvider.selectEvent(_eventModel!);

    _initActiveEvents();
    _initInactiveEvents();
  }

  void reviewEvent(Event event) async {
    _leaderboardProvider.selectEvent(event);
  }

  void addPlayers(int eventId, List<PlayerModel> players) async {
    for (var playerModel in players) {
      final player = Player(
        id: 0,
        eventId: eventId,
        name: playerModel.controller.text,
        photo: playerModel.photo!.path,
      );

      await _playersService.createPlayer(player);
    }

    _players = await _playersService.getPlayers(eventId);
    notifyListeners();
  }
}

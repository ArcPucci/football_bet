import 'dart:io';

import 'package:flutter/material.dart';
import 'package:football_bet/providers/providers.dart';
import 'package:image_picker/image_picker.dart';

import '../models/models.dart';

enum EventCreateStatus { addPlayer, eventDetails }

class EventCreateProvider extends ChangeNotifier {
  final ProfileProvider _profileProvider;
  final EventsProvider _eventsProvider;
  final TeamsProvider _teamsProvider;
  final NotificationProvider _notificationProvider;
  final SportType _sportType;

  EventCreateProvider({
    required ProfileProvider profileProvider,
    required EventsProvider eventsProvider,
    required TeamsProvider teamsProvider,
    required RouterProvider routerProvider,
    required NotificationProvider notificationProvider,
  }) : _eventsProvider = eventsProvider,
       _profileProvider = profileProvider,
       _teamsProvider = teamsProvider,
       _notificationProvider = notificationProvider,
       _sportType = routerProvider.sportType {
    init();
  }

  final ImagePicker _imagePicker = ImagePicker();

  SportType get sportType => _sportType;

  String get sportTitle => switch (_sportType) {
    SportType.soccer => "SOCCER",
    SportType.basketball => "BASKETBALL",
    SportType.football => "FOOTBALL",
  };

  EventCreateStatus _createStatus = EventCreateStatus.addPlayer;

  EventCreateStatus get createStatus => _createStatus;

  final List<PlayerModel> _playerModels = [];

  List<PlayerModel> get playerModels => _playerModels;

  TeamModel? get firstModel => _teamsProvider.firstModel;

  TeamModel? get secondModel => _teamsProvider.secondModel;

  bool get canContinue => _playerModels.every(
    (e) => e.photo != null && e.controller.text.isNotEmpty,
  );

  final TextEditingController _winController = TextEditingController();
  final TextEditingController _drawController = TextEditingController();
  final TextEditingController _loseController = TextEditingController();

  TextEditingController get winController => _winController;

  TextEditingController get drawController => _drawController;

  TextEditingController get loseController => _loseController;

  final TextEditingController _descriptionController = TextEditingController();

  TextEditingController get descriptionController => _descriptionController;

  int _days = 0;

  int get days => _days;

  int _hours = 0;

  int get hours => _hours;

  int _minutes = 0;

  int get minutes => _minutes;

  TeamModel? _selectedTeam;

  TeamModel? get selectedTeam => _selectedTeam;

  final List<LeagueModel> _leagues = [];

  List<LeagueModel> get leagues => _leagues;

  List<TeamModel> _teams = [];

  List<TeamModel> get teams => _teams;

  void init() {}

  void addPlayer() {
    _playerModels.add(PlayerModel(controller: TextEditingController()));
    notifyListeners();
  }

  void removePlayer(int index) {
    _playerModels.removeAt(index);
    notifyListeners();
  }

  void nextStep() {
    if (!canContinue) return;
    _createStatus = EventCreateStatus.eventDetails;

    notifyListeners();
  }

  void updateDuration(int days, int hours, int minutes) {
    _days = days;
    _hours = hours;
    _minutes = minutes;
    notifyListeners();
  }

  void createEvent() async {
    if (firstModel == null || secondModel == null) return;
    if (_winController.text.isEmpty ||
        _drawController.text.isEmpty ||
        _loseController.text.isEmpty ||
        _descriptionController.text.isEmpty) {
      return;
    }
    if (_days + _hours + _minutes == 0) return;

    final event = Event(
      id: 0,
      sportType: _sportType,
      firstTeam: firstModel!,
      secondTeam: secondModel!,
      odd1: double.parse(_winController.text),
      odd2: double.parse(_loseController.text),
      odd3: double.parse(_drawController.text),
      description: _descriptionController.text,
      firstTeamScore: 0,
      secondTeamScore: 0,
      startTime: DateTime.now().add(
        Duration(days: _days, hours: _hours, minutes: _minutes),
      ),
    );

    _eventsProvider.createEvent(event, _playerModels);
    if (_profileProvider.notification) {
      _notificationProvider.createNotification(event);
    }
    _profileProvider.addBet(event.sportType);
  }

  void selectTeam(bool firstTeamSelected) {
    _teamsProvider.goToTeams(firstTeamSelected, _sportType);
  }

  void onChangedLeague(List<TeamModel> teams) {
    _teams = List.from(teams);
    notifyListeners();
  }

  Future<void> pickImage(int index) async {
    final XFile? pickedFile = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (pickedFile != null) {
      _playerModels[index].photo = File(pickedFile.path);
      notifyListeners();
    }
  }
}

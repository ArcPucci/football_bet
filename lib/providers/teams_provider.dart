import 'package:flutter/material.dart';
import 'package:football_bet/models/models.dart';
import 'package:football_bet/services/services.dart';
import 'package:go_router/go_router.dart';

import '../repositories/repositories.dart';

class TeamsProvider extends ChangeNotifier {
  final TeamsService _teamsService;
  final GoRouter _router;

  List<LeagueModel> _leagues = [];

  List<LeagueModel> get leagues => _leagues;

  SportType _sportType = SportType.soccer;

  SportType get sportType => _sportType;

  List<TeamModel> _teams = [];

  List<TeamModel> get teams => _teams;

  TeamModel? _firstModel;

  TeamModel? get firstModel => _firstModel;

  TeamModel? _secondModel;

  TeamModel? get secondModel => _secondModel;

  TeamModel? _selectedTeam;

  bool _firstTeamSelected = true;

  int _selectedTeams = 0;

  int get selectedTeams => _selectedTeams;

  List<TeamModel> _myTeams = [];

  List<TeamModel> get myTeams => _myTeams;

  TeamsProvider(this._teamsService, this._router) {
    init();
  }

  TeamModel? get selectedTeam => _selectedTeam;

  int? _selectedLeague;

  int? get selectedLeague => _selectedLeague;

  void init() async {
    _initLeagues();
    _myTeams = await _teamsService.getTeams(_sportType);
  }

  void reset() {
    _firstModel = null;
    _secondModel = null;
    _selectedTeam = null;
  }

  void onChangedLeague(int index) {
    final teams = _leagues[index].teams;
    _teams = List.from(teams);
    notifyListeners();
  }

  void goToTeams(bool firstTeamSelected, SportType sportType) {
    _sportType = sportType;
    _selectedTeams = 0;
    init();
    _selectedLeague = null;
    _firstTeamSelected = firstTeamSelected;
    if (_firstTeamSelected) {
      _selectedTeam = _firstModel;
    } else {
      _selectedTeam = _secondModel;
    }

    if (_selectedTeam != null) {
      if (!_selectedTeam!.customTeam) {
        for (var league in _leagues) {
          for (var team in league.teams) {
            if (team.logo != _selectedTeam?.logo) continue;
            _selectedLeague = _leagues.indexOf(league);
            notifyListeners();
            break;
          }
          if (_selectedLeague != null) break;
        }

        _teams = List.from(_leagues[_selectedLeague!].teams);
      } else {
        _selectedTeams = 1;
      }
    }

    _router.go('/events/create/teams');
  }

  void changeSwitch(int index) {
    if (_selectedTeams == index) return;
    _selectedTeams = index;
    notifyListeners();
  }

  void selectTeam(TeamModel team) {
    _selectedTeam = team;
    if (_firstTeamSelected) {
      if (_secondModel?.logo == team.logo) return;
      _firstModel = team;
    } else {
      if (_firstModel?.logo == team.logo) return;
      _secondModel = team;
    }
    notifyListeners();
  }

  void selectAndContinue() {
    if (_selectedTeam == null) return;
    _router.pop();
  }

  Future<bool> createTeam(String name, String logo, int rating) async {
    try {
      final team = TeamModel(
        id: 0,
        name: name,
        customTeam: true,
        logo: logo,
        rating: rating,
        sportType: _sportType,
      );
      await _teamsService.createTeam(team);

      _myTeams = await _teamsService.getTeams(_sportType);
      notifyListeners();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  void _initLeagues() {
    switch (_sportType) {
      case SportType.soccer:
        _leagues = List.from(TeamsRepository.soccerLeagues);
        break;
      case SportType.basketball:
        _leagues = List.from(TeamsRepository.basketballLeagues);
        break;
      case SportType.football:
        _leagues = List.from(TeamsRepository.footballLeagues);
        break;
    }

    _teams = List.from(_leagues[0].teams);
  }
}

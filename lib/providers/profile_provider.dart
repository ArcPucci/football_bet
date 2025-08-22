import 'dart:io';

import 'package:flutter/material.dart';
import 'package:football_bet/models/models.dart';
import 'package:share_plus/share_plus.dart';

import '../services/services.dart';

class ProfileProvider extends ChangeNotifier {
  final ConfigPreferences _configPreferences;

  ProfileProvider(this._configPreferences) {
    init();
  }

  int _bets = 0;

  int get bets => _bets;

  int _soccers = 0;

  int get soccers => _soccers;

  int _footballs = 0;

  int get footballs => _footballs;

  int _basketballs = 0;

  int get basketballs => _basketballs;

  int _wins = 0;

  int get wins => _wins;

  String? _profilePhoto;

  String? get profilePhoto => _profilePhoto;

  bool _notification = true;

  bool get notification => _notification;

  String _name = '';

  String get name => _name;

  String _surname = '';

  String get surname => _surname;

  void init() {
    _profilePhoto = _configPreferences.getProfilePhoto();
    _notification = _configPreferences.getNotification();
    _name = _configPreferences.getProfileName();
    _surname = _configPreferences.getProfileLastname();
    _bets = _configPreferences.getBets();
    _soccers = _configPreferences.getSoccers();
    _footballs = _configPreferences.getFootballs();
    _basketballs = _configPreferences.getBasketballs();
    _wins = _configPreferences.getWins();
    notifyListeners();
  }

  void updateProfile(String name, String surname, String? profilePhoto) async {
    _name = name;
    _surname = surname;

    await _configPreferences.setProfileName(name);
    await _configPreferences.setProfileLastname(surname);

    if (profilePhoto != null) {
      await _configPreferences.setProfilePhoto(File(profilePhoto));
      _profilePhoto = _configPreferences.getProfilePhoto();
    }
    notifyListeners();
  }

  void addBet(SportType sportType) async {
    _bets++;
    switch (sportType) {
      case SportType.soccer:
        _soccers++;
        await _configPreferences.setSoccers(_soccers);
        break;
      case SportType.basketball:
        _basketballs++;
        await _configPreferences.setBasketballs(_basketballs);
        break;
      case SportType.football:
        _footballs++;
        await _configPreferences.setFootballs(_footballs);
        break;
    }

    await _configPreferences.setBets(_bets);
    notifyListeners();
  }

  void addWin() async {
    _wins++;
    await _configPreferences.setWins(_wins);
    notifyListeners();
  }

  void updateNotification(bool value) async {
    _notification = value;
    await _configPreferences.setNotification(value);
    notifyListeners();
  }

  void shareApp() {
    const playStoreUrl =
        "https://play.google.com/store/apps/details?id=com.example.app";
    const appStoreUrl =
        "https://apps.apple.com/app/id123456789";

    final link = Platform.isAndroid ? playStoreUrl : appStoreUrl;

    Share.share("Check out my app here:\n$link");
  }
}

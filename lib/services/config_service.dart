import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfigPreferences {
  final SharedPreferences _preferences;

  ConfigPreferences(this._preferences);

  static const _shownMessageKey = 'shownMessage';
  static const _notificationKey = 'notification';
  static const _profilePhotoKey = 'profilePhoto';
  static const _profileNameKey = 'profileName';
  static const _profileLastnameKey = 'profileLastname';
  static const _betsKey = 'bets';
  static const _soccersKey = 'soccers';
  static const _footballsKey = 'fottballs';
  static const _basketballsKey = 'basketballs';
  static const _winsKey = 'wins';
  static const _firstInitKey = 'firstInit';

  Future<void> setShownMessage() async {
    await _preferences.setBool(_shownMessageKey, true);
  }

  bool getShownMessage() {
    return _preferences.getBool(_shownMessageKey) ?? false;
  }

  Future<void> setFirstInit() async {
    await _preferences.setBool(_firstInitKey, false);
  }

  bool getFirstInit() {
    return _preferences.getBool(_firstInitKey) ?? true;
  }

  Future<void> setBets(int value) async {
    await _preferences.setInt(_betsKey, value);
  }

  int getBets() {
    return _preferences.getInt(_betsKey) ?? 0;
  }

  Future<void> setSoccers(int value) async {
    await _preferences.setInt(_soccersKey, value);
  }

  int getSoccers() {
    return _preferences.getInt(_soccersKey) ?? 0;
  }

  Future<void> setFootballs(int value) async {
    await _preferences.setInt(_footballsKey, value);
  }

  int getFootballs() {
    return _preferences.getInt(_footballsKey) ?? 0;
  }

  Future<void> setBasketballs(int value) async {
    await _preferences.setInt(_basketballsKey, value);
  }

  int getBasketballs() {
    return _preferences.getInt(_basketballsKey) ?? 0;
  }

  Future<void> setWins(int value) async {
    await _preferences.setInt(_winsKey, value);
  }

  int getWins() {
    return _preferences.getInt(_winsKey) ?? 0;
  }

  Future<void> setNotification(bool value) async {
    await _preferences.setBool(_notificationKey, value);
  }

  bool getNotification() {
    return _preferences.getBool(_notificationKey) ?? true;
  }

  Future<void> setProfilePhoto(File file) async {
    final appDir = await getApplicationDocumentsDirectory();
    final fileName = file.uri.pathSegments.last;
    final savedImage = await file.copy('${appDir.path}/$fileName');

    await _preferences.setString(_profilePhotoKey, savedImage.path);
  }

  String? getProfilePhoto() {
    return _preferences.getString(_profilePhotoKey);
  }

  Future<void> clearProfilePhoto() async {
    await _preferences.remove(_profilePhotoKey);
  }

  Future<void> setProfileName(String value) async {
    await _preferences.setString(_profileNameKey, value);
  }

  String getProfileName() {
    return _preferences.getString(_profileNameKey) ?? 'Player1';
  }

  Future<void> setProfileLastname(String value) async {
    await _preferences.setString(_profileLastnameKey, value);
  }

  String getProfileLastname() {
    return _preferences.getString(_profileLastnameKey) ?? '';
  }
}

import 'package:flutter/material.dart';
import 'package:football_bet/models/models.dart';
import 'package:go_router/go_router.dart';

class RouterProvider extends ChangeNotifier {
  final GoRouter _router;

  RouterProvider(this._router);

  SportType _sportType = SportType.soccer;

  SportType get sportType => _sportType;

  String get fullPath => _router.routerDelegate.currentConfiguration.fullPath;

  void goToCreateEvent(SportType sportType) {
    _sportType = sportType;
    _router.go('/events/create');
  }

  void goToSettings() {
    _router.push('/settings');
  }

  void goToProfile() {
    _router.push('/profile');
  }

  void goToDetails() {
    _router.go('/events/details');
  }
}

import 'dart:async';

import 'package:football_bet/models/models.dart';

class EventModel {
  final Event event;
  Timer? timer;

  EventModel({required this.event, this.timer});
}

import 'package:flutter/material.dart';
import 'package:football_bet/models/models.dart';
import 'package:football_bet/services/services.dart';

class NotificationProvider extends ChangeNotifier {
  final NotificationService _notificationService;

  NotificationProvider({required NotificationService notificationService})
    : _notificationService = notificationService {
    init();
  }

  void init() async {
    _notifications = await _notificationService.getSeenNotifications();
    _unseenNotifications = await _notificationService.getUnseenNotifications();

    notifyListeners();
  }

  List<NotificationModel> _notifications = [];

  List<NotificationModel> get notifications => _notifications;

  List<NotificationModel> _unseenNotifications = [];

  List<NotificationModel> get unseenNotifications => _unseenNotifications;

  void createNotification(Event event) async {
    final remainingTime = event.startTime.difference(DateTime.now()).inMinutes;
    final notification = NotificationModel(
      id: 0,
      sportType: event.sportType,
      firstTeam: event.firstTeam.name,
      secondTeam: event.secondTeam.name,
      remainingTime: remainingTime,
    );

    await _notificationService.createNotification(notification);
    _notifications = await _notificationService.getSeenNotifications();
    _unseenNotifications = await _notificationService.getUnseenNotifications();
    notifyListeners();
  }

  void _updateNotification(NotificationModel notification) async {
    final not = notification.copyWith(seen: true);
    await _notificationService.updateNotification(not);
  }

  void updateNotifications() async {
    for(var item in _unseenNotifications) {
      _updateNotification(item);
    }

    _notifications = await _notificationService.getSeenNotifications();
    _unseenNotifications = await _notificationService.getUnseenNotifications();

    print('updated');
  }

  void clearAll() async {
    await _notificationService.clearAll();
    _notifications.clear();
    notifyListeners();
  }
}

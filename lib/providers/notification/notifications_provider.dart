import 'package:flutter/cupertino.dart';
import 'package:restaurantmanagementsystem/models/notification/notification.dart';

class NotificationProvider extends ChangeNotifier {
  List<NotificationsModel> _allNotifications = [];

  // List<NotificationsModel> get allNotifications => _allNotifications;

  allNotifications() {
    _allNotifications = [];
    for (int i = 0; i < notifications.length; i++) {
      for (int j = 0; j < notifications[i].notifications!.length; j++) {
        _allNotifications.add(notifications[i].notifications![j]);
      }
    }
    _allNotifications.sort((a, b) => a.isCompleted!.compareTo(b.isCompleted!));
    return _allNotifications;
    // notifyListeners();
  }

  //get in individual notification
  individualNotification(String type) {
    for (int i = 0; i < notifications.length; i++) {
      if (notifications[i].type == type) {
        _allNotifications = notifications[i].notifications!;
      }
    }
    _allNotifications.sort((a, b) => a.isCompleted!.compareTo(b.isCompleted!));
    return _allNotifications;
  }
}

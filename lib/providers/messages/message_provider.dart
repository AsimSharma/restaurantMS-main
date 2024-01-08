import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:restaurantmanagementsystem/models/messages/messages_model.dart';

class MessagesProvider extends ChangeNotifier {
  final List<MessagesModel> _chatList = chats;

  List<MessagesModel> get chatList => _chatList;

  //get ChatName
  String getChatName(int id) {
    for (var message in _chatList) {
      if (message.id == id) {
        return message.chatName!;
      }
    }
    return '';
  }

  //get group created at
  DateTime createdat(int id) {
    for (var message in _chatList) {
      if (message.id == id) {
        return message.createdAt!;
      }
    }
    return DateTime.now();
  }

  //get profile images
  List<String> profileImages(id) {
    for (var message in _chatList) {
      if (message.id == id) {
        return message.groupProfilesImages!;
      }
    }
    return [];
  }

  //time Provider
  String getTime(DateTime msgTime) {
    int time = DateTime.now().difference(msgTime).inMinutes;
    if (time == 0) {
      return '1 m';
    } else if (time < 60) {
      return '$time m';
    } else if (time <= 1440) {
      return DateFormat('hh:mm a').format(msgTime);
    } else if (time <= 43800) {
      return DateFormat('EEE').format(msgTime);
    } else if (time >= 10080) {
      return DateFormat('MMM dd').format(msgTime);
    }
    return '';
  }
}

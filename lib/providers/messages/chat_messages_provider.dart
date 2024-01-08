import 'package:flutter/cupertino.dart';
import 'package:restaurantmanagementsystem/models/messages/chat_message_model.dart';

class ChatMessagesProvider extends ChangeNotifier {
  final List<ChatMessagesModel> _chatMessages = chatsMessages;

  List<ChatMessagesModel> get getChatMessages => _chatMessages;
}

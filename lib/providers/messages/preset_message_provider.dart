import 'package:flutter/cupertino.dart';
import 'package:restaurantmanagementsystem/models/messages/preset_message_models.dart';

class PresetMessageProvider extends ChangeNotifier {
  final List<PresetMessagesModel> _presetMessages = presetsMessages;
  final List<PresetMessagesModel> _selectedPresetMessages = [];

  List<PresetMessagesModel> get presetMessages => _presetMessages;
  List<PresetMessagesModel> get selectedPresetMessages =>
      _selectedPresetMessages;

  //select PresetMessage
  void selectMessage(int msgId, int toId) {
    for (int i = 0; i < _presetMessages.length; i++) {
      for (int j = 0; j < _presetMessages[i].messages!.length; j++) {
        if (_presetMessages[i].messages![j].id == msgId) {
          _presetMessages[i].messages![j].isSelected =
              !_presetMessages[i].messages![j].isSelected!;
        }
      }
    }
    notifyListeners();
  }
}

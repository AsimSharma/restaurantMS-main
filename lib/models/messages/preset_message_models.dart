class PresetMessagesModel {
  int? id;
  String? to;
  List<Message>? messages;

  PresetMessagesModel({
    this.id,
    this.to,
    this.messages,
  });
}

class Message {
  int? id;
  String? message;
  bool? isSelected;
  Message({
    this.id,
    this.message,
    this.isSelected,
  });
}

List<PresetMessagesModel> presetsMessages = [
  PresetMessagesModel(
    id: 1,
    to: 'Counter',
    messages: [
      Message(
        id: 1,
        message:
            'Please forward my order to other staff, I\'m a little bit busy with other work.',
        isSelected: false,
      ),
      Message(
        id: 2,
        message: 'I didn\'t fill well so forwarded my all order for today.',
        isSelected: false,
      ),
      Message(
        id: 3,
        message: 'Please send some staff at ground floor.',
        isSelected: false,
      )
    ],
  ),
  PresetMessagesModel(
    id: 2,
    to: 'Waiter',
    messages: [
      Message(
        id: 4,
        message: 'Please service order. Order is ready.',
        isSelected: false,
      ),
      Message(
        id: 5,
        message: 'Order is being prepared be ready.',
        isSelected: false,
      )
    ],
  ),
];

class ChatMessagesModel {
  int? id;
  // String? from;
  List<ChatMessages>? chatMessage;

  ChatMessagesModel({
    this.id,
    // this.from,
    this.chatMessage,
  });
}

class ChatMessages {
  int? id;
  String? message;
  List<String>? images;
  String? sentBy;
  String? senderImage;
  DateTime? time;
  bool? isReceived;

  ChatMessages({
    this.id,
    this.message,
    this.images,
    this.sentBy,
    this.senderImage,
    this.time,
    this.isReceived,
  });
}

List<ChatMessagesModel> chatsMessages = [
  ChatMessagesModel(
    id: 1,
    chatMessage: [
      ChatMessages(
        id: 1,
        message: 'Don’t worry we will try for next time',
        images: [],
        senderImage: 'assets/brosoft_logo.png',
        isReceived: true,
        sentBy: 'Gopal',
        time: DateTime.now().subtract(const Duration(days: 2)),
      ),
      ChatMessages(
        id: 2,
        message: 'Thanks Yr',
        images: [],
        senderImage: 'assets/brosoft_logo.png',
        isReceived: false,
        sentBy: 'Gita',
        time: DateTime.now().subtract(const Duration(days: 461)),
      ),
      ChatMessages(
        id: 3,
        message: '',
        images: ['assets/brosoft_logo.png', 'assets/brosoft_logo.png'],
        senderImage: 'assets/brosoft_logo.png',
        isReceived: false,
        sentBy: 'Ramkumar',
        time: DateTime.now().subtract(const Duration(minutes: 5)),
      ),
      ChatMessages(
        id: 4,
        message: 'Yes, What\'s up',
        images: [],
        senderImage: 'assets/brosoft_logo.png',
        isReceived: true,
        sentBy: 'Gopal',
        time: DateTime.now().subtract(const Duration(minutes: 5)),
      ),
      ChatMessages(
        id: 4,
        message: 'Yes, What\'s up',
        images: [],
        senderImage: 'assets/brosoft_logo.png',
        isReceived: true,
        sentBy: 'Gopal',
        time: DateTime.now().subtract(const Duration(minutes: 3)),
      ),
      ChatMessages(
        id: 4,
        message: 'Yes, What\'s up',
        images: [],
        senderImage: 'assets/brosoft_logo.png',
        isReceived: true,
        sentBy: 'Gopal',
        time: DateTime.now().subtract(const Duration(minutes: 2)),
      ),
      ChatMessages(
        id: 4,
        message: 'Yes, What\'s up',
        images: [],
        senderImage: 'assets/brosoft_logo.png',
        isReceived: false,
        sentBy: 'Gopal',
        time: DateTime.now().subtract(const Duration(minutes: 2)),
      ),
      ChatMessages(
        id: 4,
        message: 'Yes, What\'s up',
        images: [],
        senderImage: 'assets/brosoft_logo.png',
        isReceived: true,
        sentBy: 'Gopal',
        time: DateTime.now().subtract(const Duration(minutes: 2)),
      ),
      ChatMessages(
        id: 4,
        message: 'Yes, What\'s up',
        images: [],
        senderImage: 'assets/brosoft_logo.png',
        isReceived: false,
        sentBy: 'Gopal',
        time: DateTime.now().subtract(const Duration(minutes: 2)),
      ),
      ChatMessages(
        id: 4,
        message: 'Yes, What\'s up',
        images: [],
        senderImage: 'assets/brosoft_logo.png',
        isReceived: true,
        sentBy: 'Gopal',
        time: DateTime.now().subtract(const Duration(minutes: 2)),
      ),
      ChatMessages(
        id: 4,
        message: 'Yes, What\'s up',
        images: [],
        senderImage: 'assets/brosoft_logo.png',
        isReceived: false,
        sentBy: 'Gopal',
        time: DateTime.now().subtract(const Duration(minutes: 2)),
      ),
    ],
  ),
];

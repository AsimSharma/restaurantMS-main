// ignore_for_file: public_member_api_docs, sort_constructors_first
class MessagesModel {
  int? id;
  String? profileImage;
  String? chatName;
  String? lastMessage;
  String? messageBy;
  bool? isGroup;
  List<String>? groupProfilesImages;
  DateTime? time;
  bool? isRead;
  List<Members>? members;
  DateTime? createdAt;

  MessagesModel({
    this.id,
    this.profileImage,
    this.chatName,
    this.lastMessage,
    this.messageBy,
    this.isGroup,
    this.groupProfilesImages,
    this.time,
    this.isRead,
    this.members,
    this.createdAt,
  });
}

class Members {
  int? id;
  String? name;
  String? image;
  Members({
    this.id,
    this.name,
    this.image,
  });
}

List<MessagesModel> chats = [
  MessagesModel(
    id: 1,
    profileImage: '',
    chatName: 'Waiter\'s Team',
    lastMessage: 'I Can’t take order now can any one take order.',
    messageBy: 'Gita Kumari',
    isGroup: true,
    groupProfilesImages: ['assets/brosoft_logo.png', 'assets/done.png'],
    time: DateTime.now(),
    isRead: false,
    createdAt: DateTime.now().subtract(const Duration(days: 90)),
    members: [
      Members(
        id: 1,
        name: 'Gita Kumari',
        image: 'assets/brosoft_logo.png',
      ),
      Members(
        id: 2,
        name: 'Gopal Poudel',
        image: 'assets/brosoft_logo.png',
      ),
      Members(
        id: 3,
        name: 'Salman Khan',
        image: 'assets/salman.jpg',
      ),
      Members(
        id: 4,
        name: 'Rohit Bhattarai',
        image: 'assets/brosoft_logo.png',
      ),
      Members(
        id: 5,
        name: 'Nikkhil Khanal',
        image: 'assets/meals_icon.png',
      ),
      Members(
        id: 6,
        name: 'Rajesh hamal',
        image: 'assets/done.png',
      ),
    ],
  ),
  MessagesModel(
    id: 2,
    profileImage: '',
    chatName: 'Ground Floor',
    lastMessage: 'I Can’t take order now can any one take order.',
    messageBy: 'Ram Kandel',
    isGroup: true,
    groupProfilesImages: ['assets/brosoft_logo.png', 'assets/done.png'],
    time: DateTime.now(),
    isRead: false,
    createdAt: DateTime.now().subtract(const Duration(days: 10)),
    members: [
      Members(
        id: 1,
        name: 'Gita Kumari',
        image: 'assets/brosoft_logo.png',
      ),
      Members(
        id: 2,
        name: 'Gopal Poudel',
        image: 'assets/brosoft_logo.png',
      ),
      Members(
        id: 3,
        name: 'Salman Khan',
        image: 'assets/momo.png',
      ),
      Members(
        id: 4,
        name: 'Rohit Bhattarai',
        image: 'assets/brosoft_logo.png',
      ),
      Members(
        id: 5,
        name: 'Hari Khanal',
        image: 'assets/meals_icon.png',
      ),
      Members(
        id: 6,
        name: 'Ramkumar hamal',
        image: 'assets/done.png',
      ),
    ],
  ),
  MessagesModel(
    id: 3,
    profileImage: 'assets/brosoft_logo.png',
    chatName: 'Radhashyam Sapkota',
    lastMessage: 'I Can’t take order now can any one take order.',
    messageBy: 'Radhashyam Sapkota',
    isGroup: false,
    groupProfilesImages: [],
    time: DateTime.now(),
    isRead: true,
  ),
  MessagesModel(
    id: 4,
    profileImage: 'assets/salman.jpg',
    chatName: 'Gita Kumari',
    lastMessage: 'I Can’t take order now can any one take order.',
    messageBy: 'Gita Kumari',
    isGroup: false,
    groupProfilesImages: [],
    time: DateTime.now().subtract(const Duration(days: 8)),
    isRead: true,
  ),
  MessagesModel(
    id: 5,
    profileImage: 'assets/brosoft_logo.png',
    chatName: 'Ram Kandel',
    lastMessage: 'I Can’t take order now can any one take order.',
    messageBy: 'Ram Kandel',
    isGroup: false,
    groupProfilesImages: [],
    time: DateTime.now().subtract(const Duration(minutes: 1000)),
    isRead: false,
  ),
  MessagesModel(
    id: 6,
    profileImage: 'assets/brosoft_logo.png',
    chatName: 'Radhashyam Sapkota',
    lastMessage: ' I Can’t take order now can any one take order.',
    messageBy: 'Radhashyam Sapkota',
    isGroup: false,
    groupProfilesImages: [],
    time: DateTime.now().subtract(const Duration(minutes: 80)),
    isRead: true,
  ),
  MessagesModel(
    id: 7,
    profileImage: 'assets/brosoft_logo.png',
    chatName: 'Gita Kumari',
    lastMessage: 'I Can’t take order now can any one take order.',
    messageBy: 'Gita Kumari',
    isGroup: false,
    groupProfilesImages: [],
    time: DateTime.now().subtract(const Duration(days: 900)),
    isRead: false,
  ),
];

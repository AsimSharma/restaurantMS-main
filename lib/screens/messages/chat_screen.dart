import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurantmanagementsystem/constants/colors.dart';
import 'package:restaurantmanagementsystem/constants/extensions.dart';
import 'package:restaurantmanagementsystem/constants/get_time.dart';
import 'package:restaurantmanagementsystem/models/messages/chat_message_model.dart';
import 'package:restaurantmanagementsystem/providers/messages/chat_messages_provider.dart';
import 'package:restaurantmanagementsystem/screens/messages/group_chat_info.dart';
import 'package:restaurantmanagementsystem/widgets/messages/group_profile.dart';
import 'package:restaurantmanagementsystem/widgets/messages/individual_profile.dart';

class ChatScreen extends StatelessWidget {
  final String chatName;
  final List<String> groupProfile;
  final String indvidualProfile;
  final bool isGroup;
  final int chatIndex, id;
  ChatScreen({
    Key? key,
    required this.chatName,
    required this.groupProfile,
    required this.indvidualProfile,
    required this.isGroup,
    required this.chatIndex,
    required this.id,
  }) : super(key: key);

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    ChatMessagesProvider chatMessagesProvider =
        Provider.of<ChatMessagesProvider>(context);
    List<ChatMessages> chatMessages =
        chatMessagesProvider.getChatMessages[0].chatMessage!;

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0.1.h(),
        backgroundColor: kwhiteColor,
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData.fallback(),
        title: Row(
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios),
            ),
            isGroup
                ? GroupProfile(profileImage: groupProfile)
                : IndividualProfile(image: indvidualProfile),
            Expanded(
              child: InkWell(
                onTap: isGroup
                    ? () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GroupChatInfo(
                              chatIndex: chatIndex,
                              id: id,
                            ),
                          ),
                        );
                      }
                    : null,
                child: ListTile(
                  title: Text(
                    chatName,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 0.022.h(),
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: const Text(
                    "Active 2min ago",
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
            FittedBox(
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.phone),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.video_call),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      backgroundColor: kbgColor,
      body: Padding(
        padding: EdgeInsets.all(size.height * 0.02),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(
                  minHeight: 20,
                ),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  controller: _scrollController,
                  itemCount: chatMessages.length,
                  itemBuilder: (context, index) {
                    final message = chatMessages.reversed.toList();
                    final currentMessage = message[index];
                    bool isReceived = currentMessage.isReceived!;
                    return Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 0.01.h()),
                          child: Center(
                            child: Text(
                              getChatTime(currentMessage.time!),
                              style: TextStyle(
                                fontSize: 0.01.res(),
                                color: kblackColor.withOpacity(0.5),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: isReceived
                              ? MainAxisAlignment.start
                              : MainAxisAlignment.end,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                isReceived
                                    ? Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: CircleAvatar(
                                          backgroundColor: kwhiteColor,
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Image.asset(
                                              currentMessage.senderImage!,
                                            ),
                                          ),
                                        ),
                                      )
                                    : const SizedBox(),
                                SizedBox(width: 0.02.w()),
                                Column(
                                  crossAxisAlignment: isReceived
                                      ? CrossAxisAlignment.start
                                      : CrossAxisAlignment.end,
                                  children: [
                                    //sent by name
                                    isGroup
                                        ? isReceived
                                            ? Text(currentMessage.sentBy!)
                                            : const SizedBox()
                                        : const SizedBox(),

                                    //Messages
                                    currentMessage.message != ''
                                        ? Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 0.02.w()),
                                            padding: EdgeInsets.all(
                                                size.width * 0.03),
                                            decoration: BoxDecoration(
                                              color: isReceived
                                                  ? kwhiteColor
                                                  : kblueColor,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            constraints: BoxConstraints(
                                              minHeight: 30,
                                              minWidth: 10,
                                              maxWidth: 0.55.w(),
                                            ),
                                            child: Text(
                                              currentMessage.message!,
                                              style: TextStyle(
                                                color: isReceived
                                                    ? kblackColor
                                                    : kwhiteColor,
                                              ),
                                            ),
                                          )
                                        : const SizedBox(),

                                    //images messages
                                    currentMessage.images!.isNotEmpty
                                        ? Container(
                                            constraints: BoxConstraints(
                                              minHeight: 10,
                                              minWidth: 10,
                                              maxWidth: 0.5.w(),
                                            ),
                                            child: GridView.builder(
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              gridDelegate:
                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                              ),
                                              itemCount:
                                                  currentMessage.images!.length,
                                              itemBuilder: (context, index) {
                                                return Card(
                                                  child: Image.asset(
                                                      currentMessage
                                                          .images![index]),
                                                );
                                              },
                                            ),
                                          )
                                        : const SizedBox(),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(height: 0.085.h()),
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.image),
            ),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: kgreyColor.withOpacity(0.9),
                  hintText: 'Type a message',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.send),
            ),
          ],
        ),
      ),
    );
  }
}

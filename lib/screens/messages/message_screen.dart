import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:restaurantmanagementsystem/constants/colors.dart';
import 'package:restaurantmanagementsystem/models/messages/messages_model.dart';
import 'package:restaurantmanagementsystem/models/messages/preset_message_models.dart';
import 'package:restaurantmanagementsystem/providers/messages/message_provider.dart';
import 'package:restaurantmanagementsystem/providers/messages/preset_message_provider.dart';
import 'package:restaurantmanagementsystem/screens/messages/chat_screen.dart';
import 'package:restaurantmanagementsystem/screens/messages/preset_message_widget.dart';
import 'package:restaurantmanagementsystem/screens/order/ordered_success_screen.dart';
import 'package:restaurantmanagementsystem/widgets/messages/group_profile.dart';
import 'package:restaurantmanagementsystem/widgets/messages/individual_profile.dart';
import 'package:restaurantmanagementsystem/widgets/notification/notification_button.dart';
import 'package:restaurantmanagementsystem/widgets/shared/search_box.dart';
import 'package:restaurantmanagementsystem/constants/extensions.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final messageProvider = Provider.of<MessagesProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kbgColor,
        centerTitle: true,
        iconTheme: const IconThemeData.fallback(),
        leading: IconButton(
          onPressed: () {
            showPresetMessages(context);
          },
          icon: const Icon(Icons.chat_bubble),
        ),
        title: Text(
          'Message',
          style: TextStyle(
            fontSize: 0.018.res(),
            color: kblackColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [NotificationButton()],
      ),
      backgroundColor: kbgColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SearchBox(
                label: 'Search Message',
              ),
              SizedBox(height: 0.01.h()),
              ConstrainedBox(
                constraints: const BoxConstraints(
                  minHeight: 200,
                ),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: messageProvider.chatList.length,
                  itemBuilder: (context, index) {
                    final currentChat = messageProvider.chatList[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatScreen(
                                id: currentChat.id!,
                                chatName: currentChat.chatName!,
                                groupProfile: currentChat.groupProfilesImages!,
                                isGroup: currentChat.isGroup!,
                                indvidualProfile: currentChat.profileImage!,
                                chatIndex: index,
                              ),
                            ),
                          );
                        },
                        leading: currentChat.isGroup!
                            ? GroupProfile(
                                profileImage: [
                                  currentChat.groupProfilesImages![0],
                                  currentChat.groupProfilesImages![1]
                                ],
                              )
                            : IndividualProfile(
                                image: currentChat.profileImage!),
                        title: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Text(
                            currentChat.chatName!,
                            style: TextStyle(
                              fontWeight: currentChat.isRead!
                                  ? FontWeight.normal
                                  : FontWeight.bold,
                            ),
                          ),
                        ),
                        subtitle: _message(currentChat, currentChat.time),
                        trailing: !currentChat.isRead!
                            ? Icon(
                                Icons.circle,
                                size: 0.011.res(),
                                color: kblueColor,
                              )
                            : null,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _message(MessagesModel currentChat, var time) {
    return Consumer<MessagesProvider>(
      builder: (context, provider, _) {
        return currentChat.isGroup!
            ? Row(
                children: [
                  Expanded(
                    child: Text(
                      "${currentChat.messageBy}: ${currentChat.lastMessage!}",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 0.011.res(),
                        color: currentChat.isRead!
                            ? kblackColor.withOpacity(0.5)
                            : kblackColor,
                        fontWeight: currentChat.isRead!
                            ? FontWeight.normal
                            : FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    provider.getTime(time),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 0.011.res(),
                      color: currentChat.isRead!
                          ? kblackColor.withOpacity(0.5)
                          : kblackColor,
                      fontWeight: currentChat.isRead!
                          ? FontWeight.normal
                          : FontWeight.bold,
                    ),
                  ),
                ],
              )
            : Row(
                children: [
                  Expanded(
                    child: Text(
                      currentChat.lastMessage!,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 0.011.res(),
                        color: currentChat.isRead!
                            ? kblackColor.withOpacity(0.5)
                            : kblackColor,
                        fontWeight: currentChat.isRead!
                            ? FontWeight.normal
                            : FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    provider.getTime(time),
                    style: TextStyle(
                      fontSize: 0.011.res(),
                      color: currentChat.isRead!
                          ? kblackColor.withOpacity(0.5)
                          : kblackColor,
                      fontWeight: currentChat.isRead!
                          ? FontWeight.normal
                          : FontWeight.bold,
                    ),
                  ),
                ],
              );
      },
    );
  }

//preset Messages popup
  showPresetMessages(BuildContext context) {
    final presetMsgProvider =
        Provider.of<PresetMessageProvider>(context, listen: false);
    log('${presetMsgProvider.presetMessages[0].messages![0].isSelected}');
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      constraints: BoxConstraints(
        minHeight: 200,
        maxHeight: 0.9.h(),
      ),
      backgroundColor: kwhiteColor,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      )),
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context,
              StateSetter setState /*You can rename this!*/) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Pre-Set Message ',
                        style: TextStyle(
                          color: kblueColor,
                          fontSize: 0.018.res(),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.cancel,
                            color: kredColor,
                          ))
                    ],
                  ),
                  SizedBox(height: 0.013.h()),
                  Expanded(
                    child: Container(
                      constraints: const BoxConstraints(
                        minHeight: 200,
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: presetMsgProvider.presetMessages.length,
                        itemBuilder: (context, i) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                presetMsgProvider.presetMessages[i].to!,
                                style: TextStyle(
                                  fontSize: 0.018.res(),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                constraints: const BoxConstraints(
                                  minHeight: 40,
                                ),
                                child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount:
                                      presetsMessages[i].messages!.length,
                                  itemBuilder: (context, index) {
                                    final currentPresetMsg = presetMsgProvider
                                        .presetMessages[i].messages![index];
                                    return PresetMessageCard(
                                        message: currentPresetMsg.message!,
                                        isSelected:
                                            currentPresetMsg.isSelected!,
                                        onTap: () {
                                          setState(() {
                                            presetMsgProvider.selectMessage(
                                              currentPresetMsg.id!,
                                              presetMsgProvider
                                                  .presetMessages[i].id!,
                                            );
                                          });
                                        });
                                  },
                                ),
                              ),
                              SizedBox(height: 0.01.h()),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  Center(
                    child: CustomButton(
                      name: 'Send',
                      onTap: () {
                        Navigator.pop(context);
                        Fluttertoast.showToast(
                          msg: 'Message Sent',
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 0.02.h()),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

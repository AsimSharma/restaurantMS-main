import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:restaurantmanagementsystem/constants/colors.dart';
import 'package:restaurantmanagementsystem/constants/extensions.dart';
import 'package:restaurantmanagementsystem/providers/messages/message_provider.dart';
import 'package:restaurantmanagementsystem/widgets/messages/group_profile.dart';
import 'package:restaurantmanagementsystem/widgets/messages/individual_profile.dart';

class GroupChatInfo extends StatefulWidget {
  final int chatIndex, id;

  const GroupChatInfo({Key? key, required this.chatIndex, required this.id})
      : super(key: key);

  @override
  State<GroupChatInfo> createState() => _GroupChatInfoState();
}

class _GroupChatInfoState extends State<GroupChatInfo> {
  bool _isShow = false;

  void showMembers() {
    setState(() {
      _isShow = !_isShow;
    });
  }

  @override
  Widget build(BuildContext context) {
    final messageProvider = Provider.of<MessagesProvider>(context);
    final currentMessage = messageProvider.chatList;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kwhiteColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData.fallback(),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'Profile',
          style: TextStyle(
            fontSize: 0.02.res(),
            color: kblackColor,
          ),
        ),
      ),
      backgroundColor: kbgColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 0.02.h(),
                ),
                child: GroupProfile(
                  profileImage: [
                    messageProvider.profileImages(widget.id)[0],
                    messageProvider.profileImages(widget.id)[1],
                  ],
                ),
              ),
            ),
            Text(
              messageProvider.getChatName(widget.id),
              style: TextStyle(
                fontSize: 0.018.res(),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 0.005.h()),
            Text(
              "Start From: ${DateFormat("MMM dd yyy").format(messageProvider.createdat(widget.id))}",
              style: TextStyle(
                fontSize: 0.015.res(),
                // fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 0.05.h()),
            infoOptions(
              icon: Icons.image,
              title: 'View Photos & Videos',
              onTap: () {
                log('View Photos & Videos');
              },
            ),
            SizedBox(height: 0.01.h()),
            infoOptions(
              icon: Icons.notifications,
              title: 'Notifications & Sounds',
              onTap: () {
                log('Notifications & Sounds');
              },
            ),
            SizedBox(height: 0.01.h()),
            infoOptions(
              icon: Icons.person,
              title:
                  '${currentMessage[widget.chatIndex].members!.length} Members in group',
              onTap: showMembers,
            ),
            SizedBox(height: 0.0035.h()),
            _isShow
                ? Container(
                    width: 0.87.w(),
                    constraints: const BoxConstraints(
                      minHeight: 10,
                    ),
                    decoration: BoxDecoration(
                      color: kwhiteColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount:
                          currentMessage[widget.chatIndex].members!.length,
                      itemBuilder: (context, index) {
                        final currentMember =
                            currentMessage[widget.chatIndex].members![index];
                        return ListTile(
                          leading: Padding(
                            padding: EdgeInsets.all(0.007.h()),
                            child:
                                IndividualProfile(image: currentMember.image!),
                          ),
                          title: Text(currentMember.name!),
                        );
                      },
                    ),
                  )
                : const SizedBox(),
            SizedBox(height: 0.035.h()),
          ],
        ),
      ),
    );
  }

  //options
  Widget infoOptions(
      {required IconData icon,
      required String title,
      required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 0.08.h(),
        width: 0.87.w(),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: kwhiteColor,
        ),
        child: ListTile(
          leading: Icon(icon),
          iconColor: kblackColor,
          title: Text(
            title,
            style: TextStyle(
              fontSize: 0.018.res(),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

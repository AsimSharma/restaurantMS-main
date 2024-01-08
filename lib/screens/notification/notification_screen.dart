import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurantmanagementsystem/constants/colors.dart';
import 'package:restaurantmanagementsystem/models/notification/notification.dart';
import 'package:restaurantmanagementsystem/providers/notification/notifications_provider.dart';
import 'package:restaurantmanagementsystem/widgets/notification/notification_card.dart';
import 'package:restaurantmanagementsystem/constants/extensions.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final notification = Provider.of<NotificationProvider>(context);

    return Scaffold(
      backgroundColor: kbgColor,
      appBar: AppBar(
        backgroundColor: kbgColor,
        iconTheme: const IconThemeData.fallback(),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'Notifications',
          style: TextStyle(
            fontSize: 0.018.res(),
            fontWeight: FontWeight.w700,
            color: kblackColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 0.095.h(),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: notificatonTypes.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color:
                              _currentIndex == index ? kblueColor : kwhiteColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          notificatonTypes[index],
                          style: TextStyle(
                            color: _currentIndex == index
                                ? kwhiteColor
                                : kblackColor,
                            fontSize: 0.012.res(),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: _currentIndex == 0
                  ? ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: notification.allNotifications().length,
                      itemBuilder: (context, ind) {
                        return ConstrainedBox(
                          constraints: const BoxConstraints(
                            minHeight: 80,
                          ),
                          child: NotificationsCard(
                            index: ind,
                            currentNotification:
                                notification.allNotifications(),
                          ),
                        );
                      },
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: notification
                          .individualNotification(
                              notificatonTypes[_currentIndex])
                          .length,
                      itemBuilder: (context, i) {
                        return NotificationsCard(
                          index: i,
                          currentNotification:
                              notification.individualNotification(
                                  notificatonTypes[_currentIndex]),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

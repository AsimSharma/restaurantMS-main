import 'package:flutter/material.dart';
import 'package:restaurantmanagementsystem/constants/colors.dart';
import 'package:restaurantmanagementsystem/screens/history/history_screen.dart';
import 'package:restaurantmanagementsystem/screens/notification/notification_screen.dart';
import 'package:restaurantmanagementsystem/screens/profile/personal_info_screen.dart';
import 'package:restaurantmanagementsystem/constants/extensions.dart';
import 'package:restaurantmanagementsystem/widgets/notification/notification_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbgColor,
      appBar: AppBar(
        backgroundColor: kbgColor,
        elevation: 0,
        iconTheme: const IconThemeData.fallback(),
        centerTitle: true,
        title: Text(
          'Profile',
          style: TextStyle(
            color: kblackColor,
            fontSize: 0.02.res(),
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: const [NotificationButton()],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    constraints: const BoxConstraints(
                      maxHeight: 150,
                      maxWidth: 150,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(75),
                      border: Border.all(
                        color: kblueColor,
                        width: 3,
                      ),
                      image: const DecorationImage(
                        image: AssetImage('assets/profile.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 13,
                    right: 0,
                    child: CircleAvatar(
                      backgroundColor: kwhiteColor,
                      radius: 21,
                      child: CircleAvatar(
                        backgroundColor: kblueColor,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.edit,
                            color: kwhiteColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 0.01.h(), width: double.infinity),
              Text(
                'Hari Bahadur Karki',
                style: TextStyle(
                  fontSize: 0.023.res(),
                  color: kblueColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 0.01.h()),
              Text(
                'Waiter',
                style: TextStyle(
                  fontSize: 0.016.res(),
                  color: kblueColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Divider(
                thickness: 2,
                color: kblackColor.withOpacity(0.1),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  info(title: 'रु 3000', subtitle: 'Sell'),
                  const VerticalDivider(),
                  info(title: '36', subtitle: 'Orders'),
                  const VerticalDivider(),
                  info(title: '15p', subtitle: 'Reward'),
                  const VerticalDivider(
                    color: kblackColor,
                    thickness: 1,
                  ),
                ],
              ),
              Divider(
                thickness: 2,
                color: kblackColor.withOpacity(0.1),
              ),
              const SizedBox(height: 30),
              infoBox(
                name: 'Personal Information',
                icon: Icons.person,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const PersonalInfoScreen()));
                },
              ),
              infoBox(
                name: 'History',
                icon: Icons.payments_outlined,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const HistoryScreen()));
                },
              ),
              infoBox(
                name: 'Notifications',
                icon: Icons.notifications,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const NotificationsScreen()));
                },
              ),
              infoBox(
                name: 'security',
                icon: Icons.security,
                onTap: () {},
              ),
              infoBox(
                name: 'Logout',
                icon: Icons.exit_to_app,
                onTap: () {},
              ),
              const SizedBox(height: 20),
              Image.asset('assets/brosoft_logo.png'),
              Text(
                'A Product of Brosoft Pvt. ltd',
                style: TextStyle(
                  fontSize: 0.014.res(),
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }

  Widget info({required String title, required String subtitle}) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 0.023.res(),
            color: kblueColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 0.015.res(),
            color: kblackColor.withOpacity(0.5),
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  Widget infoBox(
      {required String name,
      required IconData icon,
      required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: kblackColor.withOpacity(0.1)),
        ),
        child: ListTile(
          leading: Icon(icon),
          title: Text(
            name,
            style: TextStyle(
              fontSize: 0.018.res(),
              fontWeight: FontWeight.w500,
            ),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}

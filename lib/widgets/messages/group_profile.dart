import 'package:flutter/material.dart';
import 'package:restaurantmanagementsystem/constants/colors.dart';
import 'package:restaurantmanagementsystem/constants/extensions.dart';

class GroupProfile extends StatelessWidget {
  final List<String> profileImage;
  const GroupProfile({Key? key, required this.profileImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 0.028.res(),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: CircleAvatar(
            radius: 0.018.res(),
            backgroundColor: kblackColor.withOpacity(0.2),
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: CircleAvatar(
                radius: 0.018.res(),
                backgroundColor: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(profileImage[0]),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 15,
          left: 20,
          child: CircleAvatar(
            radius: 0.018.res(),
            backgroundColor: kblackColor.withOpacity(0.2),
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: CircleAvatar(
                radius: 0.018.res(),
                backgroundColor: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(profileImage[1]),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

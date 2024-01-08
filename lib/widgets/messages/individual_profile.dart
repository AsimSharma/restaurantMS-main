import 'package:flutter/material.dart';
import 'package:restaurantmanagementsystem/constants/colors.dart';
import 'package:restaurantmanagementsystem/constants/extensions.dart';

class IndividualProfile extends StatelessWidget {
  final String image;
  const IndividualProfile({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 0.03.res(),
      backgroundColor: kblackColor.withOpacity(0.2),
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: CircleAvatar(
          radius: 0.027.res(),

          // radius: 30,
          backgroundColor: Colors.white,
          backgroundImage: AssetImage(
            image,
          ),
        ),
      ),
    );
  }
}

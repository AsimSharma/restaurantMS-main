import 'package:flutter/material.dart';
import 'package:restaurantmanagementsystem/constants/colors.dart';
import 'package:restaurantmanagementsystem/constants/extensions.dart';

class ResAppBar extends StatelessWidget {
  final String title, location;

  const ResAppBar({Key? key, required this.title, required this.location})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: 0.02.h(),
      child: AppBar(
        title: ListTile(
          title: Text(
            'Bro Restaurant & Bar',
            style: TextStyle(
              color: kblackColor,
              fontSize: 0.02.res(),
              fontWeight: FontWeight.w700,
            ),
          ),
          subtitle: Text(
            'Bharatpur-4, Lanku Chitwan',
            style: TextStyle(
              color: kblackColor,
              fontSize: 0.01.res(),
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}

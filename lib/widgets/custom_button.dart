import 'package:flutter/material.dart';
import 'package:restaurantmanagementsystem/constants/colors.dart';
import 'package:restaurantmanagementsystem/constants/extensions.dart';

class CustomButton extends StatelessWidget {
  final String name;
  final VoidCallback onTap;
  final Color? color;
  final int? id;
  const CustomButton(
      {Key? key,
      required this.name,
      required this.onTap,
      this.color = kblueColor,
      this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        constraints: BoxConstraints(
          maxHeight: 0.075.h(),
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: Text(
          name,
          style: TextStyle(
            color: kwhiteColor,
            fontSize: 0.018.res(),
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

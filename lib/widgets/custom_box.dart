import 'package:flutter/material.dart';
import 'package:restaurantmanagementsystem/constants/colors.dart';
import 'package:restaurantmanagementsystem/constants/extensions.dart';

class CustomBox extends StatelessWidget {
  final String name;
  final bool isSelected;
  const CustomBox({Key? key, required this.name, required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 50,
        minWidth: 80,
      ),
      alignment: Alignment.center,
      margin: const EdgeInsets.only(right: 5),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: isSelected ? kblueColor : kwhiteColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Text(
        name,
        style: TextStyle(
          color: isSelected ? kwhiteColor : kblackColor,
          fontSize: 0.013.res(),
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

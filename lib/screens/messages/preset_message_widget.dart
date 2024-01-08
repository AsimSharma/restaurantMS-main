import 'package:flutter/material.dart';
import 'package:restaurantmanagementsystem/constants/colors.dart';

class PresetMessageCard extends StatelessWidget {
  final String message;
  final bool isSelected;
  final VoidCallback onTap;
  const PresetMessageCard({
    Key? key,
    required this.message,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 20,
      ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(vertical: 5),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isSelected
                ? kblueColor.withOpacity(0.5)
                : kblueColor.withOpacity(0.05),
          ),
          child: Text(
            message,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

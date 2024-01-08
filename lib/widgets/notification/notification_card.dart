import 'package:flutter/material.dart';
import 'package:restaurantmanagementsystem/constants/colors.dart';
import 'package:restaurantmanagementsystem/models/notification/notification.dart';
import 'package:restaurantmanagementsystem/screens/bill/bill_screen.dart';
import 'package:restaurantmanagementsystem/screens/meal%20ready/meal_ready_screen.dart';
import 'package:restaurantmanagementsystem/constants/extensions.dart';

class NotificationsCard extends StatelessWidget {
  final int index;
  final List<NotificationsModel> currentNotification;

  const NotificationsCard({
    Key? key,
    required this.index,
    required this.currentNotification,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isCompleted = currentNotification[index].isCompleted == 1;
    final isRequestingBill =
        currentNotification[index].icon == Icons.attach_money;
    return InkWell(
      onTap: !isCompleted
          ? () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => isRequestingBill
                      ? const BillScreen()
                      : const MealReadyScreen(),
                ),
              );
            }
          : null,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: !isCompleted
              ? currentNotification[index].color
              : currentNotification[index].color!.withOpacity(0.2),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Table ${currentNotification[index].tableNo} ',
                  style: TextStyle(
                    color: isCompleted
                        ? kblackColor.withOpacity(0.5)
                        : kwhiteColor,
                    fontSize: 0.011.res(),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            ListTile(
              leading: Icon(
                currentNotification[index].icon,
                color: isCompleted ? kblackColor.withOpacity(0.5) : kwhiteColor,
              ),
              title: Text(
                '${currentNotification[index].title}',
                style: TextStyle(
                  color:
                      isCompleted ? kblackColor.withOpacity(0.5) : kwhiteColor,
                  fontSize: 0.016.res(),
                  fontWeight: FontWeight.w700,
                ),
              ),
              subtitle: Text(
                '${currentNotification[index].des}',
                style: TextStyle(
                  color:
                      isCompleted ? kblackColor.withOpacity(0.5) : kwhiteColor,
                  fontSize: 0.013.res(),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

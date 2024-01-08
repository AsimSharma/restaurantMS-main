import 'package:flutter/material.dart';
import 'package:restaurantmanagementsystem/constants/colors.dart';
import 'package:restaurantmanagementsystem/screens/navigation.dart';
import 'package:restaurantmanagementsystem/screens/order/order_screen.dart';
import 'package:restaurantmanagementsystem/constants/extensions.dart';

class OrderedSuccessScreen extends StatelessWidget {
  const OrderedSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbgColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/done.png'),
            SizedBox(
              height: 0.035.h(),
              width: double.infinity,
            ),
            Text(
              "CONGRATULATIONS!",
              style: TextStyle(
                fontSize: 0.018.res(),
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 0.015.h()),
            Text(
              'YOUR ORDER HAS BEEN PLACE SUCCESSFULLY',
              style: TextStyle(
                fontSize: 0.013.res(),
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 0.015.h()),
            Text(
              'YOUR ORDER ID: 130',
              style: TextStyle(
                fontSize: 0.018.res(),
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 0.02.h()),
            CustomButton(
              name: 'Done',
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const NavigationScreen()));
              },
            ),
            SizedBox(height: 0.02.h()),
            CustomButton(
              name: 'VIEW ORDER DETAILS',
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const OrdersScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String name;
  final VoidCallback onTap;
  const CustomButton({
    Key? key,
    required this.name,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 0.065.h(),
        width: 0.6.w(),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: kblueColor,
        ),
        child: Text(
          name,
          style: TextStyle(
            fontSize: 0.012.res(),
            color: kwhiteColor,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

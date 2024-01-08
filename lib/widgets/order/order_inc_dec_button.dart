import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurantmanagementsystem/constants/colors.dart';
import 'package:restaurantmanagementsystem/providers/order/selected_food_provider.dart';
import 'package:restaurantmanagementsystem/constants/extensions.dart';

class OrderIncDecButton extends StatelessWidget {
  const OrderIncDecButton({
    Key? key,
    required this.foodId,
    required this.name,
    required this.isVeg,
    required this.price,
  }) : super(key: key);

  final int foodId;
  final String name;
  final bool isVeg;
  final String price;

  @override
  Widget build(BuildContext context) {
    // final order = Provider.of<SelectedFoodProvider>(context, listen: true);
    return Consumer<SelectedFoodProvider>(
      builder: (context, order, _) {
        return Container(
          height: 0.039.h(),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: kblueColor, borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  order.removeOrder(foodId);
                  order.updateStatus(foodId);
                  order.amount();
                  order.items();
                },
                icon: Icon(
                  Icons.remove,
                  size: 0.013.res(),
                  color: kwhiteColor,
                ),
              ),
              Text(
                order.quantity(foodId).toString(),
                style: TextStyle(
                  color: kwhiteColor,
                  fontSize: 0.015.res(),
                ),
              ),
              IconButton(
                onPressed: () {
                  order.updateQuantity(foodId);
                  order.updateStatus(foodId);
                  order.amount();
                  order.items();
                  order.quantity(foodId);
                },
                icon: Icon(
                  Icons.add,
                  size: 0.013.res(),
                  color: kwhiteColor,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

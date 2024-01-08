import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurantmanagementsystem/constants/colors.dart';
import 'package:restaurantmanagementsystem/models/food/food_categories.dart';
import 'package:restaurantmanagementsystem/providers/order/selected_food_provider.dart';
import 'package:restaurantmanagementsystem/constants/extensions.dart';

class CustomizeIncDecButton extends StatelessWidget {
  final Food orderFood;
  final int choiceAmt;
  const CustomizeIncDecButton({
    Key? key,
    required this.orderFood,
    required this.choiceAmt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final order = Provider.of<SelectedFoodProvider>(context);
    return Container(
      height: 0.055.h(),
      width: 0.313.w(),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: kwhiteColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: kblackColor.withOpacity(0.5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {
              order.custRemoveQuantity(orderFood.id!);
              order.custTotalAmt(choiceAmt, order.custQuantity(orderFood.id!));
            },
            icon: const Icon(Icons.remove),
            color: kblackColor,
          ),
          Text(
            order.custQuantity(orderFood.id!).toString(),
            style: TextStyle(
              fontSize: 0.017.res(),
              fontWeight: FontWeight.w700,
              color: kblueColor,
            ),
          ),
          IconButton(
            onPressed: () {
              order.custAddQuantity(orderFood.id!);
              order.custTotalAmt(choiceAmt, order.custQuantity(orderFood.id!));

              // order.individualTotalAmt(orderFood.id!);
              // order.updateStatus(orderFood.id!);
              // order.amount();
              // order.items();
              // order.quantity(orderFood.id!);
            },
            icon: const Icon(
              Icons.add,
              color: kblackColor,
            ),
          ),
        ],
      ),
    );
  }
}

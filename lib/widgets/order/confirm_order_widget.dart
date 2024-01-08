import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurantmanagementsystem/constants/colors.dart';
import 'package:restaurantmanagementsystem/models/order/selected_food.dart';
import 'package:restaurantmanagementsystem/providers/order/selected_food_provider.dart';
import 'package:restaurantmanagementsystem/widgets/order/order_info.dart';
import 'package:restaurantmanagementsystem/constants/extensions.dart';

class ConfirmOrderWidget extends StatelessWidget {
  const ConfirmOrderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    late TextEditingController textController;
    final order = Provider.of<SelectedFoodProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            //Info
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Order Info',
                  style: TextStyle(
                    fontSize: 0.013.res(),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                ElevatedButton.icon(
                  label: Text(
                    'Schedule',
                    style: TextStyle(
                      color: kblackColor.withOpacity(0.5),
                    ),
                  ),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kgreyColor,
                  ),
                  icon: Icon(
                    Icons.calendar_month_outlined,
                    color: kblackColor.withOpacity(0.5),
                  ),
                ),
              ],
            ),

            //Order
            ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 300),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: order.getSelectedFood.length,
                  itemBuilder: (context, index) {
                    SelectedFoodModel food = order.getSelectedFood[index];
                    textController = TextEditingController(text: food.note!);
                    return OrderInfo(
                      index: index,
                      food: food,
                    );
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Add more items Buttom
                ElevatedButton.icon(
                  onPressed: () {
                    order.isOrderPressed();
                  },
                  icon: const Icon(
                    Icons.add_circle,
                    color: kblueColor,
                  ),
                  label: Text(
                    'Add More Items',
                    style: TextStyle(
                        fontSize: 0.013.res(),
                        fontWeight: FontWeight.w700,
                        color: kblackColor),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kgreyColor,
                  ),
                ),

                //Bill
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Total",
                      style: TextStyle(
                        fontSize: 0.013.res(),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "Service Tax",
                      style: TextStyle(
                        fontSize: 0.013.res(),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "VAT 13%",
                      style: TextStyle(
                        fontSize: 0.013.res(),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "Grand Total",
                      style: TextStyle(
                        fontSize: 0.015.res(),
                        color: kblueColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "रु ${order.totalAmt}",
                      style: TextStyle(
                        fontSize: 0.013.res(),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "रु 40",
                      style: TextStyle(
                        fontSize: 0.013.res(),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "रु ${0.13 * order.totalAmt}",
                      style: TextStyle(
                        fontSize: 0.013.res(),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "रु ${(order.totalAmt + 40 + 0.13 * order.totalAmt).toStringAsFixed(2)}",
                      style: TextStyle(
                        fontSize: 0.015.res(),
                        color: kblueColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

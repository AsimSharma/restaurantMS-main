import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:provider/provider.dart';
import 'package:restaurantmanagementsystem/constants/colors.dart';
import 'package:restaurantmanagementsystem/models/order/orders_moldel.dart';
import 'package:restaurantmanagementsystem/providers/bill/bill_provider.dart';
import 'package:restaurantmanagementsystem/providers/order/orders_provider.dart';
import 'package:restaurantmanagementsystem/providers/order/selected_food_provider.dart';
import 'package:restaurantmanagementsystem/screens/order/ordered_success_screen.dart';
import 'package:restaurantmanagementsystem/widgets/order/confirm_order_widget.dart';
import 'package:restaurantmanagementsystem/widgets/notification/notification_button.dart';
import 'package:restaurantmanagementsystem/widgets/order/order_screen_widget.dart';
import 'package:restaurantmanagementsystem/constants/extensions.dart';

class SelectOrderScreen extends StatelessWidget {
  final String tableName;
  final int noOfGuest;
  final int orderNo;
  final bool isAdding;
  final int? orderId;
  const SelectOrderScreen({
    Key? key,
    required this.tableName,
    required this.noOfGuest,
    required this.orderNo,
    required this.isAdding,
    this.orderId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final order = Provider.of<SelectedFoodProvider>(context);
    final confirmOrder = Provider.of<OrderProvider>(context);
    bool isOrdered = order.isOrdered;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'Select Order',
          style: TextStyle(
            color: kblackColor,
            fontSize: 0.017.res(),
            fontWeight: FontWeight.w800,
          ),
        ),
        iconTheme: const IconThemeData(
          color: kblackColor,
        ),
        backgroundColor: kwhiteColor,
        actions: const [NotificationButton()],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      heading(name: 'Table '),
                      info(tableName: tableName),
                    ],
                  ),
                  Row(
                    children: [
                      heading(name: 'Guests '),
                      info(tableName: '$noOfGuest'),
                    ],
                  ),
                  Row(
                    children: [
                      heading(name: 'Order No '),
                      info(tableName: '$orderNo'),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 2,
              color: isOrdered ? kblueColor : kblackColor.withOpacity(0.2),
            ),
            isOrdered
                ? const ConfirmOrderWidget()
                : SelectOrderScreenWidget(tableName: tableName),
          ],
        ),
      ),
      bottomNavigationBar: isOrdered
          ? BottomContainer(
              totalItems: order.totalItem,
              totalAmt: order.totalAmtwithTax(order.totalAmt, 40, 0.13),
              buttonname: 'Confirm Order',
              onTap: order.getSelectedFood.isEmpty
                  ? () {
                      Fluttertoast.showToast(msg: 'Please add some items.');
                    }
                  : () {
                      isAdding == false
                          ? confirmOrder.addOrder(
                              OrdersModel(
                                id: confirmOrder.getOrderId,
                                totalGuest: noOfGuest,
                                isCompleted: false,
                                orders: order.getSelectedFood,
                                addedOrders: [],
                                orderNo: orderNo,
                                time: DateTime.now(),
                                scheduleFor: DateTime.now(),
                                tableName: tableName,
                              ),
                            )
                          : confirmOrder.updateOrder(
                              orderId!, order.getSelectedFood);

                      //put items in bill
                      Provider.of<BillProvider>(context, listen: false)
                          .getBill(confirmOrder.ordersList[0]);

                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const OrderedSuccessScreen()));
                      order.isOrderPressed();
                      // Provider.of<SelectedFoodProvider>(context, listen: false)
                      //     .clearSelectedFood();
                    },
            )
          : BottomContainer(
              totalItems: order.totalItem,
              totalAmt: order.totalAmt,
              buttonname: 'View Order',
              onTap: order.getSelectedFood.isEmpty
                  ? () {
                      Fluttertoast.showToast(msg: 'Please add some items.');
                    }
                  : () {
                      order.isOrderPressed();
                      // log("${order.getSelectedFood.length}");
                    },
            ),
    );
  }

  Widget info({required String tableName}) {
    return Text(
      tableName,
      style: TextStyle(
        fontSize: 0.018.res(),
        color: kblueColor,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget heading({required String name}) {
    return Text(
      name,
      style: TextStyle(
        fontSize: 0.013.res(),
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class BottomContainer extends StatefulWidget {
  final int totalItems;
  final int totalAmt;
  final String buttonname;
  final VoidCallback onTap;
  const BottomContainer(
      {Key? key,
      required this.totalItems,
      required this.totalAmt,
      required this.buttonname,
      required this.onTap})
      : super(key: key);

  @override
  State<BottomContainer> createState() => _BottomContainerState();
}

class _BottomContainerState extends State<BottomContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 0.08.h(),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: kblueColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "${widget.totalItems} items",
            style: TextStyle(
              color: kwhiteColor,
              fontSize: 0.013.res(),
              fontWeight: FontWeight.w700,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: VerticalDivider(
              thickness: 2,
              width: 30,
              color: kwhiteColor,
            ),
          ),
          Text(
            "रु ${widget.totalAmt}",
            style: TextStyle(
              color: kwhiteColor,
              fontSize: 0.018.res(),
              fontWeight: FontWeight.w700,
            ),
          ),
          InkWell(
            onTap: widget.onTap,
            child: Container(
              height: 0.047.h(),
              padding: const EdgeInsets.all(9),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kwhiteColor,
              ),
              child: Text(
                widget.buttonname,
                style: TextStyle(
                  color: kblackColor,
                  fontSize: 0.013.res(),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurantmanagementsystem/constants/colors.dart';
import 'package:restaurantmanagementsystem/providers/order/orders_provider.dart';
import 'package:restaurantmanagementsystem/screens/order/select_order_sreen.dart';
import 'package:restaurantmanagementsystem/constants/extensions.dart';

class OrderCard extends StatelessWidget {
  final int currentIndex, selectedIndex;
  const OrderCard({
    Key? key,
    required this.currentIndex,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var order = Provider.of<OrderProvider>(context);
    var currentOrders = order.ordersList[currentIndex];
    bool haveAdded = currentOrders.addedOrders!.isNotEmpty;
    int time = DateTime.now().difference(currentOrders.time!).inMinutes;

    return Container(
      height: 0.55.h(),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: kblueColor,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: 0.07.h(),
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: kblueColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "Table ${currentOrders.tableName}",
                      style: TextStyle(
                        color: kwhiteColor,
                        fontSize: 0.012.res(),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: VerticalDivider(
                        color: kwhiteColor,
                        thickness: 1,
                      ),
                    ),
                    Text(
                      '${order.ordersList.length} Items',
                      style: TextStyle(
                        color: kwhiteColor,
                        fontSize: 0.009.res(),
                        fontWeight: FontWeight.w800,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Order ${currentOrders.orderNo}',
                      style: TextStyle(
                        color: kwhiteColor,
                        fontSize: 0.012.res(),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: VerticalDivider(
                        color: kwhiteColor,
                        thickness: 1,
                      ),
                    ),
                    Text(
                      '$time m ago',
                      style: TextStyle(
                        color: kwhiteColor,
                        fontSize: 0.009.res(),
                        fontWeight: FontWeight.w800,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 200),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: currentOrders.orders!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text(
                      "${currentOrders.orders![index].quantity}",
                      style: TextStyle(
                        fontSize: 0.012.res(),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    title: Text(
                      currentOrders.orders![index].foodName!,
                      style: TextStyle(
                        fontSize: 0.012.res(),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: currentOrders.orders![index].note!.isNotEmpty
                        ? Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: kgreyColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              currentOrders.orders![index].note!,
                              style: TextStyle(
                                fontSize: 0.012.res(),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        : null,
                    trailing: Text(
                      "रु ${currentOrders.orders![index].price!}",
                      style: TextStyle(
                        fontSize: 0.012.res(),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: haveAdded
                ? const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Divider(
                      color: kblueColor,
                      thickness: 1,
                    ),
                  )
                : const SizedBox(),
          ),
          haveAdded
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${currentOrders.addedOrders!.length} items added",
                            style: TextStyle(
                              color: kredColor,
                              fontSize: 0.0095.res(),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'Order No ${currentOrders.orderNo}',
                                style: TextStyle(
                                  color: kredColor,
                                  fontSize: 0.0095.res(),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(1.0),
                                child: VerticalDivider(
                                  color: kredColor,
                                  thickness: 2,
                                ),
                              ),
                              Text(
                                '$time m ago',
                                style: TextStyle(
                                  color: kredColor,
                                  fontSize: 0.0095.res(),
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),

                      // Added Items
                      SizedBox(
                        height: 100,
                        child: ListView.builder(
                            // physics: const NeverScrollableScrollPhysics(),
                            itemCount: currentOrders.addedOrders!.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: Text(
                                  "${currentOrders.addedOrders![index].quantity}",
                                  style: TextStyle(
                                    fontSize: 0.012.res(),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                title: Text(
                                  currentOrders.addedOrders![index].foodName!,
                                  style: TextStyle(
                                    fontSize: 0.012.res(),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                subtitle: currentOrders
                                        .orders![index].note!.isNotEmpty
                                    ? Container(
                                        padding: const EdgeInsets.all(10),
                                        margin: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: kgreyColor,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Text(
                                          currentOrders.orders![index].note!,
                                          style: TextStyle(
                                            fontSize: 0.012.res(),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      )
                                    : null,
                                trailing: Text(
                                  "रु ${currentOrders.addedOrders![index].price!}",
                                  style: TextStyle(
                                    fontSize: 0.012.res(),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                )
              : const SizedBox(),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Divider(
              color: kblueColor,
              thickness: 1,
            ),
          ),
          SizedBox(
            child: !currentOrders.isCompleted!
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          order.cancelOrder(currentOrders.id!);
                        },
                        icon: const Icon(
                          Icons.cancel,
                          color: kredColor,
                        ),
                        label: Text(
                          'Cancel Order',
                          style: TextStyle(
                            color: kredColor,
                            fontSize: 0.012.res(),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SelectOrderScreen(
                                  tableName: currentOrders.tableName!,
                                  noOfGuest: currentOrders.totalGuest!,
                                  orderNo: currentOrders.orderNo!,
                                  isAdding: true,
                                  orderId: currentOrders.id,
                                ),
                              ));
                        },
                        icon: const Icon(
                          Icons.add_circle,
                          color: kblueColor,
                        ),
                        label: Text(
                          'Add Order',
                          style: TextStyle(
                            color: kblueColor,
                            fontSize: 0.012.res(),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  )
                : const Text(
                    'Order Completed',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
          ),
          SizedBox(height: 0.01.h()),
        ],
      ),
    );
  }
}

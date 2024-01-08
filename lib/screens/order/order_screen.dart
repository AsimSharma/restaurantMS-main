import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurantmanagementsystem/constants/colors.dart';
import 'package:restaurantmanagementsystem/providers/order/orders_provider.dart';
import 'package:restaurantmanagementsystem/widgets/notification/notification_button.dart';
import 'package:restaurantmanagementsystem/widgets/order/order_card.dart';
import 'package:restaurantmanagementsystem/widgets/shared/search_box.dart';
import 'package:restaurantmanagementsystem/constants/extensions.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<OrderProvider>(context);
    return Scaffold(
      backgroundColor: kbgColor,
      appBar: AppBar(
        elevation: 0,
        title: ListTile(
          title: Text(
            'Bro Restaurant & Bar',
            style: TextStyle(
              color: kblackColor,
              fontSize: 0.018.res(),
              fontWeight: FontWeight.w700,
            ),
          ),
          subtitle: Text(
            'Bharatpur-4, Lanku Chitwan',
            style: TextStyle(
              color: kblackColor,
              fontSize: 0.01.res(),
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        leading: Image.asset('assets/logo1.png'),
        actions: const [NotificationButton()],
        iconTheme: const IconThemeData(color: kblackColor),
        backgroundColor: kbgColor,
      ),
      body: orders.ordersList.isEmpty
          ? Center(
              child: Text(
                'No Orders yet!',
                style: TextStyle(
                  fontSize: 0.021.res(),
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  //Orders Text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            _currentIndex = 0;
                          });
                        },
                        child: Text(
                          "Orders",
                          style: TextStyle(
                            fontSize: 0.018.res(),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _currentIndex = 1;
                          });
                        },
                        icon: const Icon(Icons.request_quote_rounded),
                      ),
                    ],
                  ),

                  const SearchBox(label: 'Search by Order Number'),
                  SizedBox(height: 0.013.h()),

                  //Orders Container
                  Expanded(
                    child: ListView.builder(
                      itemCount: orders.ordersList.length,
                      itemBuilder: (context, index) {
                        return OrderCard(
                          currentIndex: index,
                          selectedIndex: _currentIndex,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

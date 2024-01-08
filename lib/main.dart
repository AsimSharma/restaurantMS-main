import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurantmanagementsystem/providers/bill/bill_provider.dart';
import 'package:restaurantmanagementsystem/providers/food/food_provider.dart';
import 'package:restaurantmanagementsystem/providers/meal%20taken/meals_taken_provider.dart';
import 'package:restaurantmanagementsystem/providers/messages/message_provider.dart';
import 'package:restaurantmanagementsystem/providers/messages/chat_messages_provider.dart';
import 'package:restaurantmanagementsystem/providers/messages/preset_message_provider.dart';
import 'package:restaurantmanagementsystem/providers/notification/notifications_provider.dart';
import 'package:restaurantmanagementsystem/providers/order/orders_provider.dart';
import 'package:restaurantmanagementsystem/providers/order/selected_food_provider.dart';
import 'package:restaurantmanagementsystem/providers/table/table_provider.dart';
import 'package:restaurantmanagementsystem/screens/home_screen.dart';
import 'package:restaurantmanagementsystem/screens/navigation.dart';
import 'package:restaurantmanagementsystem/screens/notification/notification_screen.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => SelectedFoodProvider()),
      ChangeNotifierProvider(create: (context) => TableProvider()),
      ChangeNotifierProvider(create: (context) => OrderProvider()),
      ChangeNotifierProvider(create: (context) => MealsTakenProvider()),
      ChangeNotifierProvider(create: (context) => BillProvider()),
      ChangeNotifierProvider(create: (context) => NotificationProvider()),
      ChangeNotifierProvider(create: (context) => FoodProvider()),
      ChangeNotifierProvider(create: (context) => MessagesProvider()),
      ChangeNotifierProvider(create: (context) => PresetMessageProvider()),
      ChangeNotifierProvider(create: (context) => ChatMessagesProvider()),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Restaurant Management System',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/": (context) => const NavigationScreen(),
        "/HOME": (context) => const HomeScreen(),
        "/NOTIFICATION": (context) => const NotificationsScreen(),
      },
    );
  }
}

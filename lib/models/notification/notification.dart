// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:restaurantmanagementsystem/constants/colors.dart';

class Notifications {
  final String? type;
  final Color? color;
  final IconData? icon;
  final List<NotificationsModel>? notifications;

  Notifications({
    this.type,
    this.notifications,
    this.color,
    this.icon,
  });
}

class NotificationsModel {
  int? id;
  String? title;
  String? tableNo;
  String? des;
  IconData? icon;
  int? isCompleted;
  Color? color;

  NotificationsModel({
    this.id,
    this.title,
    this.tableNo,
    this.des,
    this.icon,
    this.isCompleted,
    this.color,
  });
}

List<String> notificatonTypes = [
  'All Categories',
  'Meals',
  'Beverages',
  'Desserts',
  'Bills'
];

List<Notifications> notifications = [
  Notifications(
    type: 'Meals',
    color: kredColor,
    icon: Icons.food_bank_outlined,
    notifications: [
      NotificationsModel(
        id: 1,
        title: 'Meal Ready',
        des: "Order no 130 meal is ready to serve.",
        tableNo: '3C',
        isCompleted: 0,
        color: kredColor,
        icon: Icons.food_bank_outlined,
      ),
      NotificationsModel(
        id: 1,
        title: 'Meal Ready',
        des: "Order no 140 meal is ready to serve.",
        tableNo: '1G',
        isCompleted: 1,
        color: kredColor,
        icon: Icons.food_bank_outlined,
      ),
      NotificationsModel(
        id: 1,
        title: 'Meal Ready',
        des: "Order no 150 meal is ready to serve.",
        tableNo: '2A',
        isCompleted: 1,
        color: kredColor,
        icon: Icons.food_bank_outlined,
      ),
    ],
  ),
  Notifications(
    type: 'Beverages',
    color: korangeColor,
    icon: Icons.local_drink,
    notifications: [
      NotificationsModel(
        id: 2,
        title: 'Drinks Ready',
        des: "Order no 146 drinks is ready to serve.",
        tableNo: '5A',
        isCompleted: 0,
        color: korangeColor,
        icon: Icons.local_drink,
      ),
      NotificationsModel(
        id: 2,
        title: 'Drinks Ready',
        des: "Order no 146 drinks is ready to serve.",
        tableNo: '1C',
        isCompleted: 1,
        color: korangeColor,
        icon: Icons.local_drink,
      ),
      NotificationsModel(
        id: 2,
        title: 'Drinks Ready',
        des: "Order no 146 drinks is ready to serve.",
        tableNo: '1G',
        isCompleted: 0,
        color: korangeColor,
        icon: Icons.local_drink,
      ),
    ],
  ),
  Notifications(
    type: 'Desserts',
    color: kredColor,
    icon: Icons.food_bank_outlined,
    notifications: [
      NotificationsModel(
        id: 2,
        title: 'Drinks Ready',
        des: "Order no 146 Dessert is ready to serve.",
        tableNo: '5A',
        isCompleted: 1,
        color: kredColor,
        icon: Icons.food_bank_outlined,
      ),
      NotificationsModel(
        id: 2,
        title: 'Drinks Ready',
        des: "Order no 146 Dessert is ready to serve.",
        tableNo: '1C',
        isCompleted: 1,
        color: kredColor,
        icon: Icons.food_bank_outlined,
      ),
      NotificationsModel(
        id: 2,
        title: 'Drinks Ready',
        des: "Order no 146 Dessert is ready to serve.",
        tableNo: '1G',
        isCompleted: 1,
        color: kredColor,
        icon: Icons.food_bank_outlined,
      ),
    ],
  ),
  Notifications(
    type: 'Bills',
    color: kblueDimColor,
    icon: Icons.attach_money,
    notifications: [
      NotificationsModel(
        id: 2,
        title: 'Request Bill',
        des: "Table 5A is requesting a bill.",
        tableNo: '5A',
        isCompleted: 1,
        color: kblueDimColor,
        icon: Icons.attach_money,
      ),
      NotificationsModel(
        id: 2,
        title: 'Request Bill',
        des: "Table 1C is requesting a bill.",
        tableNo: '1C',
        isCompleted: 1,
        color: kblueDimColor,
        icon: Icons.attach_money,
      ),
      NotificationsModel(
        id: 2,
        title: 'Request Bill',
        des: "Table 1G is requesting a bill.",
        tableNo: '1G',
        isCompleted: 0,
        color: kblueDimColor,
        icon: Icons.attach_money,
      ),
    ],
  ),
];

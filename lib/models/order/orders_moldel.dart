import 'package:restaurantmanagementsystem/models/order/selected_food.dart';

class OrdersModel {
  int? id;
  int? orderNo;
  int? totalGuest;
  String? tableName;
  DateTime? time;
  DateTime? scheduleFor;
  bool? isCompleted;
  List<SelectedFoodModel>? orders;
  List<SelectedFoodModel>? addedOrders;

  OrdersModel({
    this.id,
    this.orderNo,
    this.totalGuest,
    this.tableName,
    this.time,
    this.scheduleFor,
    this.isCompleted,
    this.orders,
    this.addedOrders,
  });
}

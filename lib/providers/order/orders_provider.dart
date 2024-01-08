import 'package:flutter/cupertino.dart';
import 'package:restaurantmanagementsystem/models/order/orders_moldel.dart';
import 'package:restaurantmanagementsystem/models/order/selected_food.dart';

class OrderProvider extends ChangeNotifier {
  final List<OrdersModel> _orderedList = [];
  int _orderId = 0;

  List<OrdersModel> get ordersList => _orderedList;
  int get getOrderId => _orderId;

  //add order
  void addOrder(OrdersModel order) {
    _orderedList.add(order);
    _orderId++;
    notifyListeners();
  }

  //update Order
  void updateOrder(int id, List<SelectedFoodModel> order) {
    for (int i = 0; i < _orderedList.length; i++) {
      if (_orderedList[i].id == id) {
        for (int j = 0; j < order.length; j++) {
          _orderedList[i].addedOrders!.add(order[j]);
        }
      }
    }
    notifyListeners();
  }

  //cancel Order
  void cancelOrder(int id) {
    _orderedList.removeWhere((order) => order.id == id);
    notifyListeners();
  }
}

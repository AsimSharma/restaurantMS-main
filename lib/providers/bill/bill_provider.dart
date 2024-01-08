import 'package:flutter/material.dart';
import 'package:restaurantmanagementsystem/models/bill/bill_models.dart';
import 'package:restaurantmanagementsystem/models/order/orders_moldel.dart';

class BillProvider extends ChangeNotifier {
  final List<BillModel> _bills = [];
  final List<BillItem> _billsItem = [];
  int _billsId = 0;
  final int _serviceTax = 40;
  final double _vat = 0.13;

  int get serviceTax => _serviceTax;
  double get vat => _vat;

  //
  void getBill(OrdersModel order) {
    for (int i = 0; i < order.orders!.length; i++) {
      _billsItem.add(
        BillItem(
          id: order.orders![i].foodId,
          name: order.orders![i].foodName,
          note: order.orders![i].note,
          quantity: order.orders![i].quantity,
          amount: order.orders![i].price,
        ),
      );
    }
    for (int i = 0; i < order.addedOrders!.length; i++) {
      _billsItem.add(
        BillItem(
          id: order.addedOrders![i].foodId,
          name: order.addedOrders![i].foodName,
          note: order.addedOrders![i].note,
          quantity: order.addedOrders![i].quantity,
          amount: order.addedOrders![i].price,
        ),
      );
    }
    _bills.add(
      BillModel(id: _billsId, tableName: order.tableName, items: _billsItem),
    );
    _billsId++;
    notifyListeners();
  }

  //get current bill
  getBillItem(String tableName) {
    for (int i = 0; i < _bills.length; i++) {
      if (_bills[i].tableName == tableName) {
        return _bills[i];
      }
    }
  }

  // //total amount
  int totalAmt(String tableName) {
    int total = 0;
    for (int i = 0; i < _bills.length; i++) {
      if (_bills[i].tableName == tableName) {
        for (int j = 0; j < _bills[i].items!.length; j++) {
          total += _bills[i].items![j].quantity! * _bills[i].items![j].amount!;
        }
      }
    }
    return total;
  }

  //get total items quantity in bill
  int totalQuantity(String tableName) {
    int total = 0;
    for (int i = 0; i < _bills.length; i++) {
      if (_bills[i].tableName == tableName) {
        for (int j = 0; j < _bills[i].items!.length; j++) {
          total += _bills[i].items![j].quantity!;
        }
      }
    }
    return total;
  }
}

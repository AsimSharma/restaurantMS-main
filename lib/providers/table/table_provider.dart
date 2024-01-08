import 'package:flutter/material.dart';
import 'package:restaurantmanagementsystem/models/table/table_model.dart';

class TableProvider extends ChangeNotifier {
  final List<TableModel> _tables = alltables1;

  List<TableModel> get allTable => _tables;

  //reserve table
  void reserve(int id) {
    for (int i = 0; i < _tables.length; i++) {
      for (int j = 0; j < _tables[i].tables.length; j++) {
        if (id == _tables[i].tables[j].id) {
          _tables[i].tables[j].isReserved = true;
        }
      }
    }
    notifyListeners();
  }

  //unreserve table
  void unReserve(int id) {
    for (int i = 0; i < _tables.length; i++) {
      for (int j = 0; j < _tables[i].tables.length; j++) {
        if (id == _tables[i].tables[j].id) {
          _tables[i].tables[j].isReserved = false;
          _tables[i].tables[j].totalGuest = 0;
        }
      }
    }
    notifyListeners();
  }

  //get table reserve status
  bool isReserved(int tableId) {
    for (int i = 0; i < _tables.length; i++) {
      for (int j = 0; j < _tables[i].tables.length; j++) {
        if (tableId == _tables[i].tables[j].id &&
            _tables[i].tables[j].isReserved) {
          return true;
        }
      }
    }
    return false;
  }

  //void update guests in table
  void updateGuest(int tableId, int totalGuest) {
    for (int i = 0; i < _tables.length; i++) {
      for (int j = 0; j < _tables[i].tables.length; j++) {
        if (tableId == _tables[i].tables[j].id) {
          _tables[i].tables[j].totalGuest = totalGuest;
        }
      }
    }
    notifyListeners();
  }

  //get total guests in table
  int getTotalGuest(int tableId) {
    for (int i = 0; i < _tables.length; i++) {
      for (int j = 0; j < _tables[i].tables.length; j++) {
        if (tableId == _tables[i].tables[j].id) {
          return _tables[i].tables[j].totalGuest;
        }
      }
    }
    return 0;
  }
}

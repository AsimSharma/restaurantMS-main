import 'package:flutter/material.dart';
import 'package:restaurantmanagementsystem/models/meal%20ready/meals_ready_model.dart';

class MealsTakenProvider extends ChangeNotifier {
  final List<MealsReadyModel> _meals = mealsReady;
  int _totalSelected = 0;
  bool _isAllSelected = false;

  List<MealsReadyModel> get getOrderedItem => _meals;
  int get totalSelected => _totalSelected;
  bool get isAllSelected => _isAllSelected;

  //select item
  void selectItem(int mealId) {
    for (int i = 0; i < _meals.length; i++) {
      for (int j = 0; j < _meals[i].meals!.length; j++) {
        if (_meals[i].meals![j].id == mealId) {
          _meals[i].meals![j].isSelected = !_meals[i].meals![j].isSelected!;
        }
      }
    }
    notifyListeners();
  }

  //select all items
  void selectAllItem(int id) {
    _isAllSelected = !_isAllSelected;
    for (int j = 0; j < _meals[id].meals!.length; j++) {
      if (_meals[id].meals![j].isSelected == false) {
        _meals[id].meals![j].isSelected = !_meals[id].meals![j].isSelected!;
      }
    }
    notifyListeners();
  }

  //total selected
  void totalSelectedItem(int id) {
    _totalSelected = 0;
    for (int i = 0; i < _meals[id].meals!.length; i++) {
      if (_meals[id].meals![i].isSelected == true) {
        _totalSelected++;
      }
      if (_totalSelected == _meals[id].meals!.length) {
        _isAllSelected = true;
      } else {
        _isAllSelected = false;
      }
    }
    notifyListeners();
  }

  //change to completed
  void completed(int id) {
    _meals[id].isCompleted = true;
    notifyListeners();
  }
}

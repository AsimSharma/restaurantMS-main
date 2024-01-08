import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:restaurantmanagementsystem/models/food/food_categories.dart';
import 'package:restaurantmanagementsystem/models/order/selected_food.dart';

class SelectedFoodProvider extends ChangeNotifier {
  final List<SelectedFoodModel> _selectedFoods = [];
  final List<FoodCategories> _allFoods = allFoodList;
  final Set<String> _addons = {};

  bool _isAdded = false;
  bool _isOrdered = false;
  int _totalAmt = 0;
  int _totalItem = 0;
  int _indTotalAmt = 0;

  List<SelectedFoodModel> get getSelectedFood => _selectedFoods;
  List<FoodCategories> get allFoods => _allFoods;
  List<String> get addons => _addons.toList();
  bool get isAddedItem => _isAdded;
  bool get isOrdered => _isOrdered;
  int get totalAmt => _totalAmt;
  int get totalItem => _totalItem;
  int get indTotalAmt => _indTotalAmt;

  //Add Order to selected List
  void addOrder(SelectedFoodModel order) {
    _selectedFoods.add(order);
    _isAdded = true;
    notifyListeners();
  }

  //Update Quantity in selected
  void updateQuantity(int foodId) {
    for (int i = 0; i < _selectedFoods.length; i++) {
      if (_selectedFoods[i].foodId == foodId) {
        _selectedFoods[i].quantity = _selectedFoods[i].quantity + 1;
      }
    }
    notifyListeners();
  }

  //set note
  void setNote(String text, int foodId) {
    for (int i = 0; i < _selectedFoods.length; i++) {
      if (_selectedFoods[i].foodId == foodId) {
        _selectedFoods[i].note = text;
      }
    }
    notifyListeners();
  }

  //remove items from selected list
  void removeOrder(int foodId) {
    for (int i = 0; i < _selectedFoods.length; i++) {
      if (_selectedFoods[i].foodId == foodId) {
        if (_selectedFoods[i].quantity > 0) {
          _selectedFoods[i].quantity--;
          if (_selectedFoods[i].quantity == 0) {
            _indTotalAmt = 0;
            _selectedFoods.remove(_selectedFoods[i]);
          }
        } else {
          _selectedFoods.remove(_selectedFoods[i]);
        }
      }
    }
    notifyListeners();
  }

  //order clicked or not
  void isOrderPressed() {
    _isOrdered = !_isOrdered;
    notifyListeners();
  }

  //get total quantity of items
  int quantity(int foodId) {
    int quantity = 0;
    for (int i = 0; i < _selectedFoods.length; i++) {
      if (_selectedFoods[i].foodId == foodId) {
        quantity += _selectedFoods[i].quantity;
      }
    }
    return quantity;
  }

  //get Total items
  void items() {
    _totalItem = 0;
    for (int i = 0; i < _selectedFoods.length; i++) {
      _totalItem += _selectedFoods[i].quantity;
    }
    notifyListeners();
  }

  //selected Food total amount
  void amount() {
    _totalAmt = 0;
    for (int i = 0; i < _selectedFoods.length; i++) {
      _totalAmt += _selectedFoods[i].quantity * _selectedFoods[i].price!;
    }
    notifyListeners();
  }

  //total amount with vat and sevice tax
  int totalAmtwithTax(int amt, int serviceTax, double vat) {
    int calc = (amt + serviceTax + (vat * amt).toInt());
    return calc;
  }

  //update added status
  void updateStatus(int id) {
    for (int i = 0; i < _allFoods.length; i++) {
      for (int j = 0; j < _allFoods[i].food!.length; j++) {
        if (id == _allFoods[i].food![j].id) {
          _allFoods[i].food![j].isAdded = true;
        }
      }
    }
    notifyListeners();
  }

  //get individual food total amt
  void individualTotalAmt(int foodId) {
    for (int i = 0; i < _selectedFoods.length; i++) {
      if (_selectedFoods[i].foodId == foodId) {
        _indTotalAmt = (_selectedFoods[i].quantity * _selectedFoods[i].price!);
      }
    }
    notifyListeners();
  }

  //add a note
  void addNote(String note, int foodId) {
    for (int i = 0; i < _selectedFoods.length; i++) {
      if (_selectedFoods[i].foodId == foodId) {
        _selectedFoods[i].note = note;
      }
    }
    notifyListeners();
  }

  //clear selected food list
  void clearSelectedFood() {
    _totalAmt = 0;
    _totalItem = 0;
    _selectedFoods.clear();
    notifyListeners();
  }

  //customizable food methods
  final List<SelectedFoodModel> _custFood = [];
  int _custTotalAmt = 0;
  int _addonAmt = 0;

  List<SelectedFoodModel> get custFood => _custFood;
  int get custTotal => _custTotalAmt;

  //add food
  void addCustFood(SelectedFoodModel food) {
    _custFood.add(food);
    notifyListeners();
  }

  //total quantity
  int custQuantity(int foodId) {
    for (int i = 0; i < _custFood.length; i++) {
      if (_custFood[i].foodId == foodId) {
        return _custFood[i].quantity;
      }
    }
    return 0;
  }

  //add Quantity in selected
  void custAddQuantity(int foodId) {
    for (int i = 0; i < _custFood.length; i++) {
      if (_custFood[i].foodId == foodId) {
        _custFood[i].quantity = _custFood[i].quantity + 1;
      }
    }
    notifyListeners();
  }

  //remove Quantity in selected
  void custRemoveQuantity(int foodId) {
    for (int i = 0; i < _custFood.length; i++) {
      if (_custFood[i].foodId == foodId) {
        _custFood[i].quantity--;
        log('${_custFood[i].quantity}');
        if (_custFood[i].quantity == 0) {
          _custFood.removeWhere((food) => food.foodId == foodId);
        }
      }
    }
    notifyListeners();
  }

  //addon amt add
  void addAddonAmt(int amt) {
    _addonAmt += amt;
    notifyListeners();
  }

  //addon amt less
  void lessAddonAmt(int amt) {
    _addonAmt -= amt;
    notifyListeners();
  }

  //cust total amount
  void custTotalAmt(int choiceAmt, int quantity) {
    _custTotalAmt = 0;
    _custTotalAmt = (choiceAmt + _addonAmt) * quantity;

    notifyListeners();
  }

  //clear custFood
  void clearCustFood() {
    _custFood.clear();
    notifyListeners();
  }

  //add addons items
  void addAddons(String addon, int foodId) {
    for (int i = 0; i < _allFoods.length; i++) {
      for (int j = 0; j < _allFoods[i].food!.length; j++) {
        if (_allFoods[i].food![j].id == foodId) {
          for (int k = 0; k < _allFoods[i].food![j].addons!.length; k++) {
            if (_allFoods[i].food![j].addons![k].title == addon) {
              _allFoods[i].food![j].addons![k].isAdded =
                  !_allFoods[i].food![j].addons![k].isAdded!;

              if (_allFoods[i].food![j].addons![k].isAdded == true) {
                _addons.add(addon);
              } else if (_allFoods[i].food![j].addons![k].isAdded == false) {
                _addons.remove(addon);
              }
            }
          }
        }
      }
    }
    notifyListeners();
  }

  //is addons added
  bool isAddonAdded(String addon, int foodId) {
    for (int i = 0; i < _allFoods.length; i++) {
      for (int j = 0; j < _allFoods[i].food!.length; j++) {
        if (_allFoods[i].food![j].id == foodId) {
          for (int k = 0; k < _allFoods[i].food![j].addons!.length; k++) {
            if (_allFoods[i].food![j].addons![k].title == addon) {
              if (_allFoods[i].food![j].addons![k].isAdded!) {
                return true;
              }
            }
          }
        }
      }
    }
    return false;
  }
}

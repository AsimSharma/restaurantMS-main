import 'package:flutter/cupertino.dart';
import 'package:restaurantmanagementsystem/models/food/food_categories.dart';

class FoodProvider extends ChangeNotifier {
  final List<FoodCategories> _allFoods = allFoodList;

  List<FoodCategories> get allFoods => _allFoods;
}
